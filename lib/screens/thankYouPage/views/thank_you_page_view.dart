import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/text_widget.dart';

class ThankYouPageView extends StatelessWidget {
  const ThankYouPageView({super.key});

  @override
 Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.thumb_up,
              color: AppColors.princeTonOrange, size: 30),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child: TextWidget(
                text: StringConstants.thankYou, style: context.headlineMedium),
          ),
          const SizedBox(height: 30),
          TextWidget(
              text: StringConstants.passwordUpdatedSuccessfully,
              style: context.headlineMedium),
          SizedBox(height: height * 0.3),
          ButtonWidget(
              buttonText: StringConstants.close,
              onTap: () => Navigator.pushNamed(context,Routes.MY_PROFILE)),
        ],
      ),
    );
  }
}
