import 'package:flutter/material.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/screens/resetPassword/provider/reset_password_provider.dart';
import 'package:my_stackz/screens/resetPassword/views/reset_password_form.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
   Widget build(BuildContext context) {
                     ResetPasswordProvider controller = Provider.of<ResetPasswordProvider>(context, listen: false);

    return Scaffold(
        backgroundColor: context.getTheme.primaryColor,
        appBar: AppBar(
          leading:
          InkWell(onTap: () => Navigator.pop(context), child: const Icon(Icons.close)),
          title: const TextWidget(
            text: StringConstants.resetPassword,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(children: [
              const SizedBox(height: 50),
              ResetPasswordForm(controller: controller),
              const Spacer(),
              ButtonWidget(
                  buttonText: StringConstants.resetPassword,
                  onTap: () {
                    controller.validateFields(context);
                  }),
            ])));
  }
}
