import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_stackz/screens/mpinScreen/views/pin_fields.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/text_widget.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.newLogo,
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ),
              const Text(
                'Enter your Mpin',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              const FractionallySizedBox(
                widthFactor: 1,
                child: PinputExample(),
              ),
              SizedBox(height: size.height * 0.2),
            ],
          ),
        ),
      ),
    );
  }
}
