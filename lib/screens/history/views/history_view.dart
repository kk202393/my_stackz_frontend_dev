import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/app_divider.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/text_widget.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
 Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                  text: StringConstants.profile, style: context.headlineSmall),
            ],
          ),
          const SizedBox(height: 30),
          Stack(children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: context.getTheme.primaryColor,
              child: ClipOval(child: Image.asset(AppImages.profileIcon)),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryButtonColor),
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.primaryButtonColor),
                child: const Icon(Icons.edit_outlined,
                    color: AppColors.black, size: 14),
              ),
            )
          ]),
          const SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                  text: StringConstants.history,
                  style:
                      context.bodyMedium.copyWith(fontWeight: FontWeight.w700)),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.filter_alt_outlined,
                  color: AppColors.primaryButtonColor
                ),
              ),
              const SizedBox(width: 15),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.search_outlined,
                  color: AppColors.primaryButtonColor
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => Container(
                height: 170,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.white),
                    color: AppColors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: StringConstants.homeCleaning,
                              style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                    "\n${StringConstants.jobCompleted}",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.greenCrayola))
                              ]),
                        ),
                        const Spacer(),
                        TextWidget(
                            text: "23/02/2023",
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.profileIcon, width: 44),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                  text: "John Doe",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.pineTree)),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: AppColors.princeTonOrange,
                                      size: 10),
                                  const Icon(Icons.star,
                                      color: AppColors.princeTonOrange,
                                      size: 10),
                                  const Icon(Icons.star,
                                      color: AppColors.princeTonOrange,
                                      size: 10),
                                  const Icon(Icons.star,
                                      color: AppColors.princeTonOrange,
                                      size: 10),
                                  const Icon(Icons.star,
                                      color: AppColors.princeTonOrange,
                                      size: 10),
                                  const SizedBox(width: 5),
                                  TextWidget(
                                      text: "486 Ratings",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: AppColors.pineTree))
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        const Icon(Icons.help_outline,
                            color: AppColors.black, size: 20),
                        const SizedBox(width: 5),
                        Expanded(
                          child: TextWidget(
                              text: "Need Help",
                              style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black)),
                        ),
                        const AppDivider(
                            height: 15, width: 1, color: AppColors.black),
                        const Spacer(),
                        Image.asset(AppImages.pageWithMenu,
                            width: 15, height: 16, color: AppColors.black),
                        const SizedBox(width: 5),
                        TextWidget(
                            text: "View Profile",
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black)),
                      ],
                    )
                  ],
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemCount: 5),
          const SizedBox(height: 30),
          ButtonWidget(buttonText: StringConstants.details, onTap: () {}),
        ],
      ),
    );
  }
}