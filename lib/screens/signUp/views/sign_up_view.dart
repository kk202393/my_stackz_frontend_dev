// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/signUp/provider/sign_up_Provider.dart';
import 'package:my_stackz/screens/signUp/views/sign_up_form.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/utils/utils.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpProvider controller =
        Provider.of<SignUpProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: context.getTheme.primaryColor,
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.close)),
        title: const TextWidget(
          text: StringConstants.signUp,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.isLoading,
        builder: (BuildContext context, value, Widget? child) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      const SignUpForm(),
                      const SizedBox(height: 50),
                      ButtonWidget(
                        buttonText: StringConstants.signUp,
                        onTap: () {
                          controller.validateFields(context);
                          controller.callCreateAccountApi().then(
                            (value) {
                              if (value) {
                                Navigator.pushNamed(context, Routes.LOGIN);
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              controller.isLoading.value
                  ? Utils.getLoadingUI(context)
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
