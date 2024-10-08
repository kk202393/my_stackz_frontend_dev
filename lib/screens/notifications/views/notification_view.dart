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

  Future<void> _sendNotification() async {
    try {
      List<String> providerIds = [
        '66e8094431665eb645d9b28b',
        '66503b214f59f3788a612c3d',
      ]; // Replace with actual provider IDs
      String title = 'You have an upcoming service';
      String body = 'Do you want to accept?';
      Map<String, dynamic> data = {
        'key1': 'value1',
        'key2': 'value2'
      }; // Replace with actual data

      await _cloudFunctionService.sendNotificationToProviders(
          providerIds, title, body, data);
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
