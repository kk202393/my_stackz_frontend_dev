import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppDivider extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const AppDivider({
    super.key,
    required this.width,
    this.height = 1,
    this.color = AppColors.darkGray,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}
