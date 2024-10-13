const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Initialize the Firebase Admin SDK
admin.initializeApp();

exports.sendNotificationToProviders = functions.https.onRequest(
  async (req, res) => {
    try {
      const { providerIds, title, body, data } = req.body;

      // Check if providerIds array is provided and not empty
      if (!providerIds || providerIds.length === 0) {
        return res.status(400).send({ error: "No provider IDs provided" });
      }

      // Fetch FCM tokens for the providers from Firestore
      const fcmTokens = await getFcmTokensForProviders(providerIds);

      // Handle case where no tokens are found
      if (fcmTokens.length === 0) {
        return res
          .status(404)
          .send({ error: "No FCM tokens found for the given providers" });
      }

      // Send notifications using the FCM tokens
      const response = await sendNotifications(fcmTokens, title, body, data);

      // Check how many notifications were successful
      const successCount = response.successCount || 0;
      const failureCount = response.failureCount || 0;

      // Collect errors if there are any
      const errors = response.responses
        .filter((resp) => !resp.success)
        .map((resp, idx) => ({
          token: fcmTokens[idx],
          error: resp.error.message,
        }));

      return res.status(200).send({
        success: true,
        message: `Notifications sent: ${successCount} succeeded, ${failureCount} failed`,
        successCount,
        failureCount,
        errors: errors.length > 0 ? errors : null,
      });
    } catch (error) {
      return res.status(500).send({
        error: "Internal server error",
        details: error.message,
      });
    }
  }
);

// Function to get FCM tokens for the provided provider IDs
async function getFcmTokensForProviders(providerIds) {
  const fcmTokens = [];
  const db = admin.firestore();

  for (const providerId of providerIds) {
    try {
      const providerDoc = await db
        .collection("providers")
        .doc(providerId)
        .get();

      if (providerDoc.exists) {
        // Get the FCM token (there's only one token stored now)
        const token = providerDoc.data().fcmToken;
        if (token) {
          fcmTokens.push(token); // Add the token to the list
        }
      }
    } catch (error) {
      throw new Error(
        `Error fetching FCM tokens for provider ID ${providerId}: ${error.message}`
      );
    }
  }

  return fcmTokens;
}

async function sendNotifications(fcmTokens, title, body, data) {
  const message = {
    notification: {
      title: title || "Service Request",
      body: body || "A new service request has been made",
    },
    data: {
      ...data,
      click_action: "FLUTTER_NOTIFICATION_CLICK", // Ensure that Flutter handles the notification click
    },
  };

  const multicastMessage = {
    tokens: fcmTokens, // List of FCM tokens
    ...message, // Spread the message content (notification & data)
  };

  try {
    // Send notifications via Firebase Cloud Messaging
    return await admin.messaging().sendEachForMulticast(multicastMessage);
  } catch (error) {
    throw new Error(`Failed to send notifications via FCM: ${error.message}`);
  }
}
