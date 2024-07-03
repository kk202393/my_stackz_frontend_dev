import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ImageIcons extends StatelessWidget {
  final String assetName;
  final GestureTapCallback onTap;
  final Color color;
  final double height;
  final double width;

  const ImageIcons(
      {super.key,
      required this.assetName,
      required this.onTap,
      this.color = AppColors.black,
      this.height = 24,
      this.width = 24});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Image.asset(assetName,
            height: height, width: width, color: color));
  }
}
