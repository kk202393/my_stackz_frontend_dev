import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

class CloseIcon extends StatelessWidget {
  const CloseIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: InkWell(
            onTap: () => Get.back(),
            child: Container(
                padding: const EdgeInsets.all(7),
                decoration: const BoxDecoration(
                    color: AppColors.bgColor, shape: BoxShape.circle),
                child: const Icon(Icons.close,
                    size: 20, color: AppColors.black))));
  }
}
