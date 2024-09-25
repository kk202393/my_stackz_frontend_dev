import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_stackz/main.dart';
import 'package:rxdart/rxdart.dart';

import '../routes/app_pages.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async {
    return NotificationDetails(
        android: AndroidNotificationDetails('channel id', 'channel name',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  static Future init({bool nitScheduled = false}) async {
    final android = AndroidInitializationSettings('new_logo');
    final iOS = DarwinInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: iOS);
    await _notifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (payload) async {
        /*onNotifications.add(payload.payload);*/
        navigatorKey.currentState!.pushNamed(Routes.NOTIFICATIONS_TWO);
      },
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(id, title, body, await _notificationDetails(),
          payload: payload);
}

class IOSNoticationDetails {}
