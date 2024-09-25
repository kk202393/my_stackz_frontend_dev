import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_stackz/utils/utils.dart';
import '../routes/app_pages.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await FirebaseMessaging.instance.getToken();
    await Utils().storeFcmToken(fcmToken!);
    print("Token: $fcmToken");
    // initPushNotifications();
  }

//   void handleMessage(RemoteMessage? message) {
//     if (message == null) return;
//     debugPrint('handleMessage ${message.notification}');
//     _showNotification(message);
//   }

//   Future<void> _showNotification(RemoteMessage? message) async {
//     RemoteNotification? notification = message!.notification!;
//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails('channel_id', 'channel_name',
//             channelDescription: 'channel_description', playSound: true);
//     const NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);
//     await flutterLocalNotificationsPlugin.show(notification.hashCode,
//         '${notification.title}', '${notification.body}', notificationDetails);
//   }

//   Future initPushNotifications() async {
//     FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//     FirebaseMessaging.onMessage.listen(handleMessage);
//   }
}
