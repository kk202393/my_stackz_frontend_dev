import 'package:flutter/material.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/screens/personalDeails/provider/personal_details_provider.dart';
import 'package:provider/provider.dart';

import '../../../../constants/string_constants.dart';
import '../../../../utils/input_validator.dart';
import '../../../../widgets/app_form_field.dart';

class DetailsFormField extends StatelessWidget {
  final PersonalDetailsProvider controller;

  DetailsFormField({super.key, required this.controller});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //LoginProvider loginController = Provider.of<LoginProvider>(context, listen: false);

    return Form(
      key: formKey,
      child: Column(
        children: [
          AppFormField(
            controller: controller.nameController,
            hintText: StringConstants.fullName,
            validator: (value) => InputValidator.validateFields("Name", value),
          ),
          const SizedBox(height: 10),
          AppFormField(
            controller: controller.emailController,
            hintText: StringConstants.emailId,
            validator: (value) => InputValidator.isValidEmail(value),
          ),
          const SizedBox(height: 10),
          AppFormField(
            controller: controller.phoneController,
            hintText: StringConstants.mobileNumber,
            validator: (value) => InputValidator.isValidPhoneNumber(value),
            isPhoneNumber: true,
          ),
          const SizedBox(height: 10),
          AppFormField(
            controller: controller.addressController,
            maxLines: 4,
            hintText: StringConstants.detailsAddress,
            validator: (value) =>
                InputValidator.validateFields("Address", value),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
