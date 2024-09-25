import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/models/home_page_response.dart';
import 'package:my_stackz/screens/cleaning/provider/cleaning_provider.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_colors.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/divider.dart';
import '../../../routes/app_pages.dart';

openScheduleService(BuildContext context, ServiceCategory serviceCategory) {
  showDialog(
    context: context,
    useSafeArea: true,
    builder: (builder) {
      int roomCount = 0;
      int hoursCount = 0;
      return AlertDialog(
        contentPadding: const EdgeInsets.all(0),
        insetPadding: const EdgeInsets.all(0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32))),
        title: null,
        content: SizedBox(
          width: double.infinity,
          child: Material(
            color: AppColors.white,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        TextWidget(
                          text: serviceCategory.servicecategoryName!,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.close_outlined,
                              size: 30, color: AppColors.darkGray),
                        )
                      ],
                    ),
                    const HorizontalAppDivider(color: AppColors.darkGray),
                    Column(
                      children: [
                        Row(
                          children: [
                            TextWidget(
                              text: StringConstants.price,
                              style: GoogleFonts.montserrat(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            const Spacer(),
                            TextWidget(
                              text: "${(serviceCategory.price)! * (roomCount)}",
                              style: GoogleFonts.montserrat(
                                  color: AppColors.princeTonOrange,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        const HorizontalAppDivider(color: AppColors.darkGray),
                        Row(
                          children: [
                            TextWidget(
                              text: StringConstants.room,
                              style: GoogleFonts.montserrat(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (roomCount > 0) {
                                    roomCount--;
                                  }
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryButtonColor),
                                    borderRadius: BorderRadius.circular(3),
                                    color: AppColors.primaryButtonColor),
                                child: TextWidget(
                                  text: "-",
                                  style: GoogleFonts.montserrat(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            TextWidget(
                              text: "$roomCount",
                              style: GoogleFonts.montserrat(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            const SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    if (roomCount < 11) {
                                      roomCount++;
                                    }
                                  },
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryButtonColor),
                                    borderRadius: BorderRadius.circular(3),
                                    color: AppColors.primaryButtonColor),
                                child: TextWidget(
                                  text: "+",
                                  style: GoogleFonts.montserrat(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            )
                          ],
                        ),
                        const HorizontalAppDivider(color: AppColors.darkGray),
                        Row(
                          children: [
                            TextWidget(
                              text: StringConstants.hours,
                              style: GoogleFonts.montserrat(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (hoursCount > 0) {
                                    hoursCount--;
                                  }
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryButtonColor),
                                    borderRadius: BorderRadius.circular(3),
                                    color: AppColors.primaryButtonColor),
                                child: TextWidget(
                                  text: "-",
                                  style: GoogleFonts.montserrat(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            TextWidget(
                              text: "$hoursCount",
                              style: GoogleFonts.montserrat(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            const SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (hoursCount < 11) {
                                    hoursCount++;
                                  }
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryButtonColor),
                                    borderRadius: BorderRadius.circular(3),
                                    color: AppColors.primaryButtonColor),
                                child: TextWidget(
                                  text: "+",
                                  style: GoogleFonts.montserrat(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            )
                          ],
                        ),
                        // const HorizontalAppDivider(color: AppColors.darkGray),
                        /*const Align(
                                alignment: Alignment.centerLeft,
                                child: TextWidget(
                                    text: StringConstants.additionalServices)),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                TextWidget(
                                  text: StringConstants.windowCleaning,
                                  style: GoogleFonts.montserrat(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () => controller.onBoxClicked(),
                                  child: Container(
                                    height: 20,
                                    padding: controller.isBoxClicked.value
                                        ? const EdgeInsets.symmetric(horizontal: 2)
                                        : const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 8),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: controller.isBoxClicked.value
                                                ? AppColors.spanishBlue
                                                : AppColors.black.withOpacity(0.8)),
                                        borderRadius: BorderRadius.circular(3),
                                        color: controller.isBoxClicked.value
                                            ? AppColors.spanishBlue
                                            : AppColors.white),
                                    child: controller.isBoxClicked.value
                                        ? const Icon(Icons.check,
                                            color: AppColors.white, size: 16)
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                            const HorizontalAppDivider(color: AppColors.darkGray),
                            Row(
                              children: [
                                TextWidget(
                                  text: StringConstants.ironing,
                                  style: GoogleFonts.montserrat(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () => controller.onBoxClicked(),
                                  child: Container(
                                    height: 20,
                                    padding: controller.isBoxClicked.value
                                        ? const EdgeInsets.symmetric(horizontal: 2)
                                        : const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 8),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: controller.isBoxClicked.value
                                                ? AppColors.spanishBlue
                                                : AppColors.black.withOpacity(0.8)),
                                        borderRadius: BorderRadius.circular(3),
                                        color: controller.isBoxClicked.value
                                            ? AppColors.spanishBlue
                                            : AppColors.white),
                                    child: controller.isBoxClicked.value
                                        ? const Icon(Icons.check,
                                            color: AppColors.white, size: 16)
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                            const HorizontalAppDivider(color: AppColors.darkGray),
                            Row(
                              children: [
                                TextWidget(
                                  text: StringConstants.fridgeInteriorCleaning,
                                  style: GoogleFonts.montserrat(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () => controller.onBoxClicked(),
                                  child: Container(
                                    height: 20,
                                    padding: controller.isBoxClicked.value
                                        ? const EdgeInsets.symmetric(horizontal: 2)
                                        : const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 8),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: controller.isBoxClicked.value
                                                ? AppColors.spanishBlue
                                                : AppColors.black.withOpacity(0.8)),
                                        borderRadius: BorderRadius.circular(3),
                                        color: controller.isBoxClicked.value
                                            ? AppColors.spanishBlue
                                            : AppColors.white),
                                    child: controller.isBoxClicked.value
                                        ? const Icon(Icons.check,
                                            color: AppColors.white, size: 16)
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                            const HorizontalAppDivider(color: AppColors.darkGray),
                            Row(
                              children: [
                                TextWidget(
                                  text: StringConstants.kitchenAppliances,
                                  style: GoogleFonts.montserrat(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () => controller.onBoxClicked(),
                                  child: Container(
                                    height: 20,
                                    padding: controller.isBoxClicked.value
                                        ? const EdgeInsets.symmetric(horizontal: 2)
                                        : const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 8),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: controller.isBoxClicked.value
                                                ? AppColors.spanishBlue
                                                : AppColors.black.withOpacity(0.8)),
                                        borderRadius: BorderRadius.circular(3),
                                        color: controller.isBoxClicked.value
                                            ? AppColors.spanishBlue
                                            : AppColors.white),
                                    child: controller.isBoxClicked.value
                                        ? const Icon(Icons.check,
                                            color: AppColors.white, size: 16)
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                            const HorizontalAppDivider(color: AppColors.darkGray),*/
                        const SizedBox(height: 10),
                        ButtonWidget(
                          buttonText: "Check Out >>",
                          onTap: () {
                            Navigator.pushNamed(context, Routes.DATE_AND_TIME);
                          },
                        ),
                      ],
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      );
    },
  );
}
