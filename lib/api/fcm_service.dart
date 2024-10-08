import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:my_stackz/screens/notifications/views/notification_view.dart';

class FcmService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Initialize FCM Service and listen to foreground messages
  void initialize(BuildContext context) {
    _firebaseMessaging.requestPermission();

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message received in foreground: ${message.notification}');

      // Show the notification in a dialog, Snackbar, or any UI element you prefer
      if (message.notification != null) {
        _showNotificationDialog(context, message.notification!);
      }
    });

    // Handle backround and terminated state when notificatio is clicked
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('notification clicked with data: ${message.data}');

      // Navigate to the screen based on notification data
      if (message.data.containsKey('screen')) {
        String screen = message.data['screen'];
        _navigateToScreen(context, screen, message.data);
      }
    });

    listenForTokenRefresh("user_id", "user_type");
  }

  void _navigateToScreen(
      BuildContext context, String screen, Map<String, dynamic> data) {
        if(screen == 'providerScreen'){
          Navigator.of(context);
        }
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

  // Get a device unique identifier
  Future<String?> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      //Currently we don't support firebase notification for ios devices.
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    } else {
      throw Exception('Unsupported platform');
    }
  }

  // Get FCM token and store it directly in Firestore
  Future<void> getTokenAndStoreInFirestore(
      String userId, String userType) async {
    try {
      // Retrieve the FCM token
      String? token = await _firebaseMessaging.getToken();
      String? deviceId = await getDeviceId();

      if (token != null && deviceId != null) {
        await storeTokenInFirestore(userId, userType, token, deviceId);
      }
    } catch (e) {
      print('Error fetching FCM token or device Id: $e');
    }
  }

  // Store FCM token directly in Firestore
  Future<void> storeTokenInFirestore(
      String userId, String userType, String token, String? deviceId) async {
    try {
      DocumentReference userDocRef =
          _firestore.collection("providers").doc(userId);
      await userDocRef.set({
        'fcmToken': token,
        'deviceId': deviceId,
        'lastUpdated': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (error) {
      print('Error storing FCM token in firestore:$error');
    }
  }

  /*
  this is how data is stored in Firestore
  {
  "fcmToken": {
    "device456": "abc123"
  },
  "lastUpdated": "2023-10-05T12:34:56.789Z" // Example timestamp
} 
 */

  // Listen for token refresh and store the new token in Firestore
  void listenForTokenRefresh(String userId, String userType) {
    _firebaseMessaging.onTokenRefresh.listen((newToken) async {
      String? deviceId = await getDeviceId();
      await storeTokenInFirestore(userId, userType, newToken, deviceId);
    });
  }
}
