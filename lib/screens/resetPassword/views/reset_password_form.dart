import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_stackz/models/reset_password_response.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/screens/resetPassword/provider/reset_password_provider.dart';
import 'package:provider/provider.dart';

import '../../../../constants/string_constants.dart';
import '../../../../utils/input_validator.dart';
import '../../../../widgets/app_form_field.dart';

class ResetPasswordForm extends StatelessWidget {
  final ResetPasswordProvider controller;

  const ResetPasswordForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
                 ResetPasswordProvider controller = Provider.of<ResetPasswordProvider>(context, listen: false);
             LoginProvider loginController = Provider.of<LoginProvider>(context, listen: false);

    return Form(
      key: loginController.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => AppFormField(
                controller: controller.passwordController,
                obscureText: controller.obscureText.value,
                hintText: StringConstants.enterPassword,
                onTapSuffixIcon: () => controller.onChangePasswordVisibility(),
                validator: (value) => InputValidator.isValidPassword(value),
              )),
          const SizedBox(height: 20),
          Obx(() => AppFormField(
                controller: controller.confirmPasswordController,
                obscureText: controller.obscureConfirmPasswordText.value,
                hintText: StringConstants.confirmPassword,
                onTapSuffixIcon: () =>
                    controller.onChangeConfirmPasswordVisibility(),
                validator: (value) => InputValidator.validateConfirmPassword(
                    controller.passwordController.text.trim(), value),
              )),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
