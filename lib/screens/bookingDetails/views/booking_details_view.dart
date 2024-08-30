import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/models/consumer_booking_response.dart';
import 'package:my_stackz/models/home_page_response.dart';
import 'package:my_stackz/screens/booking/provider/booking_provider.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/app_divider.dart';
import 'package:provider/provider.dart';
import '../../../constants/string_constants.dart';
import '../../../widgets/text_widget.dart';

class BookingDetailsView extends StatelessWidget {
  const BookingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    BookingProvider bookingProvider =
        Provider.of<BookingProvider>(context, listen: false);
    LoginProvider loginProvider =
        Provider.of<LoginProvider>(context, listen: false);
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);

    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: AppColors.cultured,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: TextWidget(
                    text: StringConstants.bookingAccepted,
                    style: context.headlineLarge
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                AppDivider(
                  width: size.width,
                  color: AppColors.lightSilver,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          AppImages.pageWithMenu,
                          height: size.height * 0.06,
                          color: AppColors.grayX11,
                        ),
                        SizedBox(height: size.height * 0.01),
                        TextWidget(
                          text: StringConstants.details,
                          style: context.bodyMedium.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: AppColors.graniteGray),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          AppImages.calenderIcon,
                          height: size.height * 0.06,
                          color: AppColors.grayX11,
                        ),
                        SizedBox(height: size.height * 0.01),
                        TextWidget(
                          text: StringConstants.reschedule,
                          style: context.bodyMedium.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                              color: AppColors.graniteGray),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(AppImages.cancelIcon,
                            height: size.height * 0.06),
                        SizedBox(height: size.height * 0.01),
                        TextWidget(
                          text: StringConstants.cancel,
                          style: context.bodyMedium.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                              color: AppColors.graniteGray),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                AppDivider(
                  width: size.width,
                  color: AppColors.lightSilver,
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                  width: size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white),
                      color: AppColors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: StringConstants.bookingDetails,
                        style: context.headlineLarge
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: size.height * 0.03,
                            color: AppColors.gray,
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: StringConstants.serviceLocation,
                                style: context.titleSmall
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                              TextWidget(
                                text: loginProvider.logInAPIResponse!
                                    .userAddress![0].addresses![0].address,
                                style: context.titleSmall.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color: AppColors.outerspace),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timelapse_outlined,
                            size: size.height * 0.03,
                            color: AppColors.gray,
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Time Slot",
                                style: context.titleSmall
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                              ValueListenableBuilder(
                                valueListenable: bookingProvider.timeSlotId,
                                builder: (context, value, child) {
                                  return TextWidget(
                                    text: homeProvider.homeAPIResponse.timeSlot
                                        .first.timeValue
                                        .toString(),
                                    style: context.titleSmall.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: AppColors.outerspace),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timelapse_outlined,
                            size: size.height * 0.03,
                            color: AppColors.gray,
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: StringConstants.timings,
                                style: context.titleSmall
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                              TextWidget(
                                text: bookingProvider.bookingDate.value,
                                style: context.titleSmall.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color: AppColors.outerspace),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                TextWidget(
                  text: StringConstants.topPicks,
                  style: context.headlineMedium.copyWith(
                      fontWeight: FontWeight.w700, color: AppColors.mandarin),
                ),
                SizedBox(height: size.height * 0.01),
                SizedBox(
                  height: size.height * 0.3,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: AppColors.gray),
                                color: AppColors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        topLeft: Radius.circular(5),
                                      ),
                                      child: Image.asset(
                                        AppImages.homeDesign,
                                        width: size.width * 0.4,
                                        height: size.height * 0.2,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              AppColors.white.withOpacity(0.2),
                                              AppColors.black.withOpacity(0.9),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.01),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: homeProvider
                                            .homeAPIResponse
                                            .allCategories
                                            .first
                                            .subcategories[index]
                                            .subcategoryName
                                            .toString(),
                                        style: context.titleMedium.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.black),
                                      ),
                                      SizedBox(height: size.height * 0.005),
                                      TextWidget(
                                        text: "90% Excellent Work",
                                        style: context.labelMedium.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.black),
                                      ),
                                      TextWidget(
                                        text: "Best in class",
                                        style: context.labelMedium.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: size.width * 0.02,
                        );
                      },
                      itemCount:
                          homeProvider.homeAPIResponse.allCategories.length),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
              ],
            ),
          ),
        ));
  }
}
