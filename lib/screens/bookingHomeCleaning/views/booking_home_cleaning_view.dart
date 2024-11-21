import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/app_divider.dart';
import 'package:my_stackz/widgets/text_widget.dart';

class BookingHomeCleaningView extends StatelessWidget {
  const BookingHomeCleaningView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    // onTap: () => Get.back(),
                    child: const Icon(Icons.chevron_left_outlined,
                        size: 30, color: AppColors.pineTree),
                  ),
                  SizedBox(width: width * 0.3),
                  TextWidget(
                      text: StringConstants.homeCleaning,
                      style: context.headlineSmall),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Image.asset(AppImages.completedService, width: 32),
                  const SizedBox(width: 10),
                  TextWidget(
                      text: "Service Completed",
                      style: context.headlineSmall.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.princeTonOrange)),
                  const Spacer(),
                  TextWidget(
                      text: "24/03/2021",
                      style: context.headlineSmall.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: AppColors.spanishGray))
                ],
              ),
              const SizedBox(height: 30),
              AppDivider(width: width, color: AppColors.lightSilver),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.pageWithMenu,
                          width: 39, color: AppColors.lightSilver),
                      const SizedBox(height: 10),
                      TextWidget(
                          text: "Details",
                          style: context.headlineSmall.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: AppColors.lightSilver))
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const AppDivider(
                    width: 1, height: 99, color: AppColors.lightSilver),
                const SizedBox(width: 10),
                InkWell(
                  onTap: (){},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.calenderIcon,
                          width: 38, color: AppColors.lightSilver),
                      const SizedBox(height: 10),
                      TextWidget(
                          text: "Reschedule",
                          style: context.headlineSmall.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: AppColors.lightSilver))
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const AppDivider(
                    width: 1, height: 99, color: AppColors.lightSilver),
                const SizedBox(width: 10),
                InkWell(
                  onTap: (){},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.closeIcon,
                          width: 36, color: AppColors.lightSilver),
                      const SizedBox(height: 10),
                      TextWidget(
                          text: "Cancel",
                          style: context.headlineSmall.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: AppColors.lightSilver))
                    ],
                  ),
                )
              ]),
              const SizedBox(height: 10),
              AppDivider(width: width, color: AppColors.lightSilver),
              const SizedBox(height: 30),
              TextWidget(
                  text: "Booking Details",
                  style: context.headlineSmall.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.pineTree)),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on_outlined, size: 24, color: AppColors.spanishGray),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                            text: "Service Location",
                            style: context.headlineSmall.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.black)),
                        TextWidget(
                            text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                            style: context.headlineSmall.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.spanishGray)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.access_time, size: 22, color: AppColors.spanishGray),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                            text: "Timings",
                            style: context.headlineSmall.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.black)),
                        TextWidget(
                            text: "Tuesday, 23rd March, 2021 at 10:00 am",
                            style: context.headlineSmall.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.spanishGray)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              TextWidget(
                  text: "Payment Summary",
                  style: context.headlineSmall.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.pineTree)),
              const SizedBox(height: 10),
              Row(
                children: [
                  TextWidget(
                      text: "3BHK x 1",
                      style: context.headlineSmall.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.black)),
                  const Spacer(),
                  TextWidget(
                      text: "S\$. 50.00",
                      style: context.headlineSmall.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.black)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  TextWidget(
                      text: "Safety and Support fee",
                      style: context.headlineSmall.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.black)),
                  const Spacer(),
                  TextWidget(
                      text: "S\$. 1.00",
                      style: context.headlineSmall.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.black)),
                ],
              ),
              const SizedBox(height: 10),
              TextWidget(
                  text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: context.headlineSmall.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.spanishGray)),
              const SizedBox(height: 30),
              Row(
                children: [
                  TextWidget(
                      text: "Amount Paid",
                      style: context.headlineSmall.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.black)),
                  const Spacer(),
                  TextWidget(
                      text: "S\$. 51.00",
                      style: context.headlineSmall.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.black)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(AppImages.reviewerProfile,
                        width: 42),
                    const SizedBox(width: 10),
                    TextWidget(
                        text: "John Doe",
                        style: context.headlineSmall.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.pineTree)),
                  ]),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
