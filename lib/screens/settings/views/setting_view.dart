import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/screens/settings/provider/setting_provider.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/utils/input_validator.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/new_text_form_field.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    SettingsProvider controller =
        Provider.of<SettingsProvider>(context, listen: false);


    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Form(
        key: controller.formKey,
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
                    text: StringConstants.profile,
                    style: context.headlineSmall),
              ],
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: Stack(children: [
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
            ),
            const SizedBox(height: 30),
            TextWidget(
                text: StringConstants.settings,
                style:
                    context.bodyMedium.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 40),
            TextWidget(
                text: StringConstants.oldPassword,
                style: context.bodyMedium.copyWith(fontSize: 16)),
            const SizedBox(height: 5),
            SettingsTextField(
                hint: StringConstants.enterOldPassword,
                keyboardType: TextInputType.text,
                validator: (String? value) => InputValidator.validateFields(
                    value!, StringConstants.enterOldPassword),
                formKey: controller.formKey,
                controller: controller.oldPasswordController),
            const SizedBox(height: 20),
            TextWidget(
                text: StringConstants.newPassword,
                style: context.bodyMedium.copyWith(fontSize: 16)),
            const SizedBox(height: 5),
            SettingsTextField(
                hint: StringConstants.enterNewPassword,
                keyboardType: TextInputType.text,
                validator: (String? value) => InputValidator.validateFields(
                    value!, StringConstants.enterNewPassword),
                formKey: controller.formKey,
                controller: controller.newPasswordController),
            const SizedBox(height: 10),
            Row(
              children: [
                TextWidget(
                    text: StringConstants.show,
                    style: context.bodyMedium
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w700)),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () => controller.onClickShow(),
                  child:  Icon(
                      controller.show.value
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank,
                      size: 20)),
                
                const Spacer(),
                const Icon(Icons.visibility_outlined,
                    color: AppColors.black, size: 20)
              ],
            ),
            const SizedBox(height: 50),
            ButtonWidget(
                buttonText: StringConstants.changePassword,
                onTap: () {
                  controller.validateFields(context);
                }),
          ],
        ),
      ),
    );
  }
}
