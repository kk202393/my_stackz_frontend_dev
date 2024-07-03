import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/additionalDetails/provider/additional_details_provider.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class AdditionalDetailsView extends StatelessWidget {
  const AdditionalDetailsView({super.key});

  @override
 Widget build(BuildContext context) {
           AdditionalDetailsProvider controller = Provider.of<AdditionalDetailsProvider>(context, listen: false);

    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
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
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: AppColors.silverSand)),
                  child: ValueListenableBuilder(
                    valueListenable: controller.isSwitched,
                    builder: (BuildContext context, bool value, Widget? child) { 
                      return Switch(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          onChanged: (value) => controller.toggleSwitch(value),
                          value: controller.isSwitched.value,
                          activeColor: AppColors.silverSand,
                          activeTrackColor: AppColors.white,
                          inactiveThumbColor: AppColors.silverSand,
                          inactiveTrackColor: AppColors.white,
                        );
                     },
                  
                  )
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
                Image.asset(AppImages.chatIcon, width: 25),
                const SizedBox(width: 10),
                Expanded(
                  child: TextWidget(
                      text: StringConstants.descriptionMessage,
                      style: context.bodySmall
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400)),
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
              onTap: () => Navigator.pushNamed(context,Routes.DATE_AND_TIME))
        ],
      ),
    ));
  }
}
