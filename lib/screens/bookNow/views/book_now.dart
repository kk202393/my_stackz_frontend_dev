import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';

import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/app_divider.dart';

import '../../../constants/string_constants.dart';
import '../../../widgets/text_widget.dart';

class BookNow extends StatelessWidget {
  const BookNow({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = MediaQuery.of(context).size.width;

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
                        text: StringConstants.bookNow,
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
                              text: StringConstants.Bookinghistory,
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
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.maize),
                          color: AppColors.maize,
                        ),
                        child: TextWidget(
                          textAlign: TextAlign.center,
                          text: StringConstants.servicesByCategory,
                          style: context.headlineMedium,
                        ),
                      ),
                    ),
//
                    Padding(
                      padding: const EdgeInsets.only(top:  15.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Theme.of(context).primaryColor,
                                    child: ClipOval(
                                      child: Image.asset(
                                        "assets/images/cleaning.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "Cleaning",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Theme.of(context).primaryColor,
                                    child: ClipOval(
                                      child: Image.asset(
                                        "assets/images/aircon_servicing.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "Aircon Servicing",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Theme.of(context).primaryColor,
                                    child: ClipOval(
                                      child: Image.asset(
                                        "assets/images/handyman_icon.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "Handyman",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ])),
        ));
  }
}
