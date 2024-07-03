import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class HorizontalAppDivider extends StatelessWidget {
  final EdgeInsets margin;
  final Color color;

  const HorizontalAppDivider(
      {super.key,
      this.margin = const EdgeInsets.symmetric(vertical: 10),
      this.color = AppColors.black});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        height: 1, width: width, margin: margin, color: color.withOpacity(0.5));
  }
}
