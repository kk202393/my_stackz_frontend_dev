import 'package:flutter/material.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';

import '../constants/app_colors.dart';
import 'text_widget.dart';

class WrapCapsule extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;

  const WrapCapsule({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(8)),
          child: TextWidget(text: text, style: context.displaySmall)),
    );
  }
}
