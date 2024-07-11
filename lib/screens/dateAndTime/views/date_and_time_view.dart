import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/text_widget.dart';


class DateAndTimeView extends StatelessWidget {
  const DateAndTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () =>Navigator.pop(context),
                  child: const Icon(Icons.chevron_left_outlined,
                      size: 30, color: AppColors.pineTree),
                ),
                SizedBox(width: width * 0.3),
                TextWidget(
                    text: StringConstants.selectDateAndTime,
                    style: context.headlineSmall)
              ],
            ),
            const SizedBox(height: 20),
            TextWidget(
              text: StringConstants.whenWouldYouLikeYourServices,
              style: context.headlineMedium,
            ),
            const SizedBox(height: 20),
            TextWidget(
                text: "May 2021",
                style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w400, fontSize: 22)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 10),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColors.gray,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: Offset(0, 5))
                            ],
                            border: Border.all(color: AppColors.white),
                            borderRadius: BorderRadius.circular(23),
                            color: AppColors.white),
                        child: Column(children: [
                          TextWidget(
                            text: "01",
                            style: context.titleLarge,
                          ),
                          const SizedBox(height: 15),
                          TextWidget(
                            text: "Sat",
                            style: context.labelMedium,
                          )
                        ])),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 10),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColors.gray,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: Offset(0, 5))
                            ],
                            border: Border.all(color: AppColors.white),
                            borderRadius: BorderRadius.circular(23),
                            color: AppColors.white),
                        child: Column(children: [
                          TextWidget(
                            text: "02",
                            style: context.titleLarge,
                          ),
                          const SizedBox(height: 15),
                          TextWidget(
                            text: "Sun",
                            style: context.labelMedium,
                          )
                        ])),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 10),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColors.gray,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: Offset(0, 5))
                            ],
                            border: Border.all(color: AppColors.white),
                            borderRadius: BorderRadius.circular(23),
                            color: AppColors.white),
                        child: Column(children: [
                          TextWidget(
                            text: "03",
                            style: context.titleLarge,
                          ),
                          const SizedBox(height: 15),
                          TextWidget(
                            text: "Mon",
                            style: context.labelMedium,
                          )
                        ])),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 10),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColors.gray,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: Offset(0, 5))
                            ],
                            border: Border.all(color: AppColors.white),
                            borderRadius: BorderRadius.circular(23),
                            color: AppColors.white),
                        child: Column(children: [
                          TextWidget(
                            text: "04",
                            style: context.titleLarge,
                          ),
                          const SizedBox(height: 15),
                          TextWidget(
                            text: "Tues",
                            style: context.labelMedium,
                          )
                        ]))
                  ]),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.white),
                          borderRadius: BorderRadius.circular(23),
                          color: AppColors.white),
                      child: TextWidget(
                        text: "10:30 pm",
                        style: context.titleLarge,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.white),
                          borderRadius: BorderRadius.circular(23),
                          color: AppColors.white),
                      child: TextWidget(
                        text: "12:30 pm",
                        style: context.titleLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.white),
                          borderRadius: BorderRadius.circular(23),
                          color: AppColors.white),
                      child: TextWidget(
                        text: "02:30 pm",
                        style: context.titleLarge,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.white),
                          borderRadius: BorderRadius.circular(23),
                          color: AppColors.white),
                      child: TextWidget(
                        text: "03:30 pm",
                        style: context.titleLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.white),
                          borderRadius: BorderRadius.circular(23),
                          color: AppColors.white),
                      child: TextWidget(
                        text: "04:30 pm",
                        style: context.titleLarge,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.white),
                          borderRadius: BorderRadius.circular(23),
                          color: AppColors.white),
                      child: TextWidget(
                        text: "05:00 pm",
                        style: context.titleLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            ButtonWidget(
              buttonText: 'Next',
              onTap: () => Navigator.pushNamed(context,Routes.SELECT_ADDRESS),
            )
          ],
        ),
      )),
    );
  }
}
