import 'package:flutter/material.dart';
import 'package:my_stackz/api/cloud_function_service.dart';
import 'package:my_stackz/api/notification_api.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/text_widget.dart';

import '../../../widgets/button_widget.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({
    super.key,
  });

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  final CloudFunctionService _cloudFunctionService = CloudFunctionService();

  @override
  void initState() {
    super.initState();
    NotificationApi.init();
    listenNotifications();
  }

  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) {}

// providers id
// 67056ece31665eb645d9b87c
// onepus nord 2 : TP1A.220905.001(provider)
// consumer id
// 67056e3231665eb645d9b85f
// samsung :UP1A.231005.007(consumer)

  Future<void> _sendNotification() async {
    try {
      List<String> providerIds = [
        '67056ece31665eb645d9b87c', //provider
        '67056e3231665eb645d9b85f', //consumer just for testing
      ]; // Replace with actual provider IDs

      String title = 'You have an upcoming service';
      String body = 'Do you want to accept?';

      // Additional data that needs to be passed along with the notification
      Map<String, dynamic> data = {
        'request_id': '12345', // Example request ID
        'user_name': 'John Doe', // Example user name
      };

      String screen = 'providerScreen'; // Specify the screen to open

      // Send the notification with screen info and data payload
      await _cloudFunctionService.sendNotificationToProviders(
          providerIds, title, body, screen, data);
    } catch (e) {
      print('Error sending notification: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.cultured1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                color: AppColors.yellowOrange,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.black,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                    ),
                    TextWidget(
                      text: "Notification",
                      style: context.bodySmall.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: AppColors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.2,
              ),
              // ButtonWidget(
              //   buttonText: 'Send Notification',
              //   width: size.width * 0.5,
              //   buttonColor: AppColors.red,
              //   onTap: () {
              //     NotificationApi.showNotification(
              //         title: "You have an upcoming service",
              //         body: "Do you want to accept?",
              //         payload: "myStackz");
              //   },
              // )
              ButtonWidget(
                buttonText: 'Send Notification',
                width: size.width * 0.5,
                buttonColor: AppColors.red,
                onTap: _sendNotification,
              )
            ],
          ),
        ),
      ),
    );
  }
}
