import 'package:flutter/material.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/signUp/provider/sign_up_Provider.dart';
import 'package:my_stackz/screens/signUp/views/sign_up_form.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
             // SignUpProvider controller = Provider.of<SignUpProvider>(context, listen: false);

    return Scaffold(
        backgroundColor: context.getTheme.primaryColor,
        appBar: AppBar(
          leading:
              InkWell(onTap: () =>Navigator.pop(context), child: const Icon(Icons.close)),
          title: const TextWidget(
            text: StringConstants.signUp,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(children: [
              const SizedBox(height: 50),
              const SignUpForm(),
              const SizedBox(height: 50),
              ButtonWidget(
                  buttonText: StringConstants.signUp,
                  onTap: () {
                    // controller.validateFields(context);
                    // controller.callCreateAccountApi();
                    Navigator.pushNamed(context, Routes.HOME);
                  }),
            ])));
  }

}