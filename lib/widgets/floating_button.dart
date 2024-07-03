import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class FloatingButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FloatingButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: AppColors.primaryButtonColor,
        child: const Icon(Icons.add, size: 30, color: AppColors.white));
  }
}
