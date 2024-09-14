import 'package:flutter/material.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';

import '../constants/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final double width;
  final Color? buttonColor;
  final Color? textColor;
  final GestureTapCallback onTap;
  final IconData? icon;
  final bool showIcon;

  const ButtonWidget(
      {super.key,
      required this.buttonText,
      this.buttonColor,
      this.width = double.infinity,
      this.textColor = AppColors.white,
      required this.onTap,
      this.icon,
      this.showIcon = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: AppColors.paleCyan.withOpacity(0.3),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(1, 8),
          )
        ]),
        child: ElevatedButton(
            onPressed: onTap,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                      visible: showIcon,
                      child: Icon(icon, color: AppColors.white)),
                  Visibility(
                      visible: showIcon, child: const SizedBox(width: 10)),
                  Text(buttonText,
                      style: context.displayLarge.copyWith(color: textColor))
                ])));
  }
}
