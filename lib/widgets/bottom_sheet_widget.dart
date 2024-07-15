import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_colors.dart';

getBottomSheet(Widget widget, BuildContext context,
    {bool isDismissible = true}) {
  return showModalBottomSheet(
      isDismissible: isDismissible,
      useSafeArea: true,
      context: context,
      barrierColor: AppColors.black1.withOpacity(0.5),
      isScrollControlled: true,
      showDragHandle: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(26),
          topLeft: Radius.circular(26),
        ),
      ),
      builder: (builder) {
        return Builder(builder: (builder) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(builder).viewInsets.bottom),
            child: Container(
                decoration: const BoxDecoration(color: AppColors.white),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: widget),
          );
        });
      });
}
