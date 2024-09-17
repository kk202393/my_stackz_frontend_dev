import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FcmService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Initialize FCM Service and listen to foreground messages
  void initialize(BuildContext context) {
    _firebaseMessaging
        .requestPermission(); // Request notification permission for iOS (if needed)

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message received in foreground: ${message.notification}');

      // Show the notification in a dialog, Snackbar, or any UI element you prefer
      if (message.notification != null) {
        _showNotificationDialog(context, message.notification!);
      }
    });

    // Handle token refreshes
    listenForTokenRefresh("user_id", "user_type");
  }

  // Show a simple dialog for foreground messages
  void _showNotificationDialog(
      BuildContext context, RemoteNotification notification) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(notification.title ?? 'Notification'),
        content: Text(notification.body ?? 'No message body'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  // Get FCM token and store it directly in Firestore
  Future<void> getTokenAndStoreInFirestore(
      String userId, String userType) async {
    try {
      // Retrieve the FCM token
      String? token = await _firebaseMessaging.getToken();
      //fcm token:
      // fltCugBbSM-bne_ulm9V3T:APA91bFO9g90P6TRW-CtlW3_skaG_9qDb9enRURwSEOX754cW6DOtcFBBc9-wKd_n9apDdizEAxbnZjrsaLFr952Vgd-IyN2ytd8tLPjk_F6Fh-Uo7ZSmfW8icvnrZeSAhtDiTiq6ZkP

      // 2nd token
      //"fyRFOhoSQ9Criqt0Sgzcip:APA91bEyoWo0RKvzJZdFcVbJr62DhzQXNRkUDVhObqYkaNZsGnzOMX1NDiyhKKRRxf1rxALLX0fLyiy7dEw7IiqvqAzJ0uc2ESl7Cjw0yE_2WolPWkZ5ujLFdoSS3d8m_K09XIr9XAHJ"
      print('FCM token: $token');
      if (token != null) {
        // Store the token in Firestore
        await storeTokenInFirestore(userId, userType, token);
      }
    } catch (e) {
      print('Error fetching FCM token: $e');
    }
  }

  // Store FCM token directly in Firestore
  Future<void> storeTokenInFirestore(
      String userId, String userType, String token) async {
    try {
      // Define the Firestore document based on user type (e.g., users, providers)
      DocumentReference userDocRef =
          _firestore.collection("providers").doc(userId);

      // Store the FCM token in an array to support multiple tokens per user
      await userDocRef.set({
        'fcmTokens': FieldValue.arrayUnion([token]), // Avoids duplicates
        'lastUpdated': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true)); // Merges new data with existing document

      print('FCM token successfully stored in Firestore.');
    } catch (e) {
      print('Error storing FCM token in Firestore: $e');
    }
  }

  // Listen for token refresh and store the new token in Firestore
  void listenForTokenRefresh(String userId, String userType) {
    _firebaseMessaging.onTokenRefresh.listen((newToken) async {
      print('New FCM token: $newToken');
      await storeTokenInFirestore(userId, userType, newToken);
    });
  }
}
