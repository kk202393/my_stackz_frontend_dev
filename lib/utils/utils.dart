import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import '../widgets/snack_bar.dart';

class Utils {
  static setStatus(String code,
      {String? message, SnackType snackType = SnackType.info}) {
    var text = message ?? '';
    Snack.show(
        content: '$code $text',
        snackType: snackType,
        behavior: SnackBarBehavior.floating);
  }

  //create a function to return Uint8List from string
  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  setSystemOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.princeTonOrange,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark));
  }

  static getLoadingUI(BuildContext context) {
    return Container(
      color: AppColors.primaryButtonColor.withOpacity(0.3),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: const Center(
        heightFactor: 5.0,
        widthFactor: 5.0,
        child: SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(AppColors.primaryButtonColor),
            color: AppColors.primaryButtonColor,
            strokeWidth: 2.2,
          ),
        ),
      ),
    );
  }
}
