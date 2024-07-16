import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/models/home_page_response.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/additionalDetails/provider/additional_details_provider.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../../widgets/divider.dart';

class AdditionalDetailsView extends StatelessWidget {
  const AdditionalDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    AdditionalDetailsProvider controller =
        Provider.of<AdditionalDetailsProvider>(context, listen: false);
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    final ServiceCategory serviceCategory = homeProvider.selectedServiceCategory;

    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                TextWidget(
                  text: serviceCategory.servicecategoryName,
                ),
                const Spacer(),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, Routes.CLEANING),
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
                      text: "${serviceCategory.price}",
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
                      onTap: () => controller.onClickRemoveRooms(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.primaryButtonColor),
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
                    ValueListenableBuilder(
                        valueListenable: controller.numberOfRooms,
                        builder: (context, value, child) {
                          return TextWidget(
                            text: "${controller.numberOfRooms.value}",
                            style: GoogleFonts.montserrat(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          );
                        }),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () => controller.onClickAddRooms(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.primaryButtonColor),
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
                      onTap: () => controller.onClickRemoveHours(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.primaryButtonColor),
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
                    ValueListenableBuilder(
                        valueListenable: controller.numberOfHours,
                        builder: (context, value, child) {
                          return TextWidget(
                            text: "${controller.numberOfHours.value}",
                            style: GoogleFonts.montserrat(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          );
                        }),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () => controller.onClickAddHours(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.primaryButtonColor),
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
                const Align(
                    alignment: Alignment.centerLeft,
                    child:
                        TextWidget(text: StringConstants.additionalServices)),
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
                const HorizontalAppDivider(color: AppColors.darkGray),
                const SizedBox(height: 10),
                ButtonWidget(
                    buttonText: "Check Out >>",
                    onTap: () {
                      Navigator.pushNamed(context, Routes.ADDITIONAL_DETAILS);
                    }),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.chevron_left_outlined,
                      size: 30, color: AppColors.pineTree),
                ),
                SizedBox(width: width * 0.3),
                TextWidget(
                  text: StringConstants.additionalDetails,
                  style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white),
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Image.asset(AppImages.pawPrint, width: 25),
                  const SizedBox(width: 10),
                  TextWidget(
                      text: StringConstants.petAtHome,
                      style: context.displayMedium),
                  const Spacer(),
                  Container(
                      height: 25,
                      width: 45,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: AppColors.silverSand)),
                      child: ValueListenableBuilder(
                        valueListenable: controller.isSwitched,
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          return Switch(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) =>
                                controller.toggleSwitch(value),
                            value: controller.isSwitched.value,
                            activeColor: AppColors.silverSand,
                            activeTrackColor: AppColors.white,
                            inactiveThumbColor: AppColors.silverSand,
                            inactiveTrackColor: AppColors.white,
                          );
                        },
                      )),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white),
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Image.asset(AppImages.chatIcon, width: 25),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextWidget(
                        text: StringConstants.descriptionMessage,
                        style: context.bodySmall.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white),
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryButtonColor),
                        color: AppColors.primaryButtonColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Image.asset(AppImages.imageIcon, width: 20),
                        const SizedBox(width: 10),
                        TextWidget(
                            text: StringConstants.addImage,
                            style: context.bodySmall.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryButtonColor),
                        color: AppColors.primaryButtonColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        const Icon(Icons.camera_alt_outlined, size: 20),
                        const SizedBox(width: 10),
                        TextWidget(
                            text: StringConstants.addImage,
                            style: context.bodySmall.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            ButtonWidget(
                buttonText: 'Proceed',
                onTap: () => Navigator.pushNamed(context, Routes.DATE_AND_TIME))
          ],
        ),
      )),
    );
  }
}
