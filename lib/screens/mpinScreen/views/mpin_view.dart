import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_stackz/screens/mpinScreen/views/pin_fields.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class MpinView extends StatelessWidget {
  const MpinView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child:
        Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 15),
            child: Column(children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.newLogo,
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ),
              SizedBox(height: size.height*0.08),
              FractionallySizedBox(
                widthFactor: 1,
                child: PinputExample(),
              ),
              SizedBox(height: size.height*0.2),
              RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                      text: StringConstants.notHaveAccount,
                      style: context.titleMedium,
                      children: <TextSpan>[
                        TextSpan(
                            text: "${StringConstants.signUp}!",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                    context, Routes.SIGN_UP);
                              },
                            style: context.titleMedium.copyWith(
                                color: AppColors.cyanBlue,
                                fontWeight: FontWeight.w700)),
                      ])),
              const SizedBox(height: 20)
            ])),
      ),
    );
  }
}
