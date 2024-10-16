import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/screens/signUp/provider/sign_up_Provider.dart';
import 'package:provider/provider.dart';

import '../../../../constants/string_constants.dart';
import '../../../../utils/input_validator.dart';
import '../../../../widgets/app_form_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpProvider controller = Provider.of<SignUpProvider>(context, listen: false);
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          AppFormField(
            controller: controller.nameController,
            hintText: StringConstants.enterName,
            validator: (value) => InputValidator.validateFields("Name", value),
          ),
          const SizedBox(height: 20),
          AppFormField(
            controller: controller.emailController,
            hintText: StringConstants.enterEmail,
            validator: (value) => InputValidator.isValidEmail(value),
          ),
          const SizedBox(height: 20),
          AppFormField(
                controller: controller.passwordController,
                obscureText: controller.obscureText.value,
                hintText: StringConstants.enterPassword,
                onTapSuffixIcon: () => controller.onChangePasswordVisibility(),
                validator: (value) => InputValidator.isValidPassword(value),
              ),
          const SizedBox(height: 20),
          AppFormField(
            controller: controller.phoneController,
            hintText: StringConstants.enterMobileNumber,
            validator: (value) => InputValidator.isValidPhoneNumber(value),
            isPhoneNumber: true,
            keyboardType: TextInputType.number,
            maxLength: 10,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
