import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/personalDeails/provider/personal_details_provider.dart';
import 'package:my_stackz/screens/personalDeails/views/details_form_fields.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class PersonalDetailView extends StatelessWidget {
  const PersonalDetailView({super.key});

  @override
 Widget build(BuildContext context) {
               PersonalDetailsProvider controller = Provider.of<PersonalDetailsProvider>(context, listen: false);

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
                  text: StringConstants.personalDetails,
                  style: context.bodyMedium
                      .copyWith(fontWeight: FontWeight.w700)),
              const Spacer(),
              InkWell(
                onTap: () => Navigator.pushNamed(context,Routes.PERSONAL_DETAILS),
                child: TextWidget(
                    text: "EDIT",
                    style: context.bodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryButtonColor)),
              )
            ],
          ),
          const SizedBox(height: 30),
          DetailsFormField(controller: controller),
          const SizedBox(height: 30),
          ButtonWidget(
              buttonText: StringConstants.updateProfile,
              onTap: () {
                // Get.back();
              }),
        ],
      ),
    );
  }
}