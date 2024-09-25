import 'package:flutter/material.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/text_widget.dart';

class NotificationTwo extends StatefulWidget {
  final String? payload;

  const NotificationTwo({super.key, this.payload});

  @override
  State<NotificationTwo> createState() => _NotificationTwoState();
}

class _NotificationTwoState extends State<NotificationTwo> {
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
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                color: AppColors.yellowOrange,
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){Navigator.pop(context);},
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.black,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: size.width*0.3,),
                    TextWidget(
                      text: "Accepted",
                      style: context.bodySmall.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: AppColors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height*0.2,),
              TextWidget(
                text: widget.payload ?? "",
                style: context.bodySmall.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              TextWidget(
                text: "Booking Accepted",
                style: context.bodySmall.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: AppColors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
