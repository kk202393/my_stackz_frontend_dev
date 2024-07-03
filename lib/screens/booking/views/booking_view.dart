import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/widgets/app_divider.dart';
import 'package:my_stackz/widgets/text_widget.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  // onTap: () => Get.back(),
                  child: const Icon(Icons.chevron_left_outlined,
                      size: 30, color: AppColors.pineTree),
                ),
                const Spacer(),
                const TextWidget(
                  text: StringConstants.bookings,
                ),
                const Spacer(),
                Icon(Icons.filter_alt_outlined,
                    color: AppColors.primaryButtonColor.withOpacity(0.5)),
                const SizedBox(width: 10),
                const Icon(Icons.search_outlined,
                    color: AppColors.primaryButtonColor),
              ],
            ),
            const SizedBox(height: 20),
            ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Container(
                  height: 170,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
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
                            Image.asset(AppImages.reviewerProfile, width: 44),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                    text: "Joeie Senon",
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
                              text: "View Project",
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
                itemCount: 15),
          ],
        ),
      ),
    );
  }
}
