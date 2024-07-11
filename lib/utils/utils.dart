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
// ignore_for_file: constant_identifier_names, non_constant_identifier_names


class ConstValue {
  ConstValue._();
  // padding
  static const double LEFT_PADDING = 12.0;
  static const double RIGHT_PADING = 12.0;
  static const double TOP_PADDING = 12.0;
  static const double BOTTOM_PADDING = 12.0;
  static const double ALL_PADDING = 12.0;
  static const double SMALL_PADDING = 12.0;
  static const double X_SMALL_PADDING = 4.0;
  static const double LARGE_PADDING = 16.0;

  // space between
  static const double HORIZONTAL_SPACE = 20.0;
  static const double SMALL_VERTICAL_SPACE = 8.0;
  static const double X_SMALL_VERTICAL_SPACE = 4.0;
  static const double SMALL_HORIZONTAL_SPACE = 8.0;
  static const double LARGE_VERTICAL_SPACE = 30.0;
  static const double LARGE_HORIZONTAL_SPACE = 30.0;
  static const double VERTICAL_SPACE = 20.0;

  //border Radius
  static const double SMALL_BORDER_RADIUS = 8.0;
  static const double BORDER_RADIUS = 16.0;
  static const double LARGE_BORDER_RADIUS = 30.0;

  //elevation
  static const double ELEVATION = 8.0;
  static const double SMALL_ELEVATION = 2.0;
  static const double LARGE_ELEVATION = 12.0;

  // date formatter 
  // static DateFormat DATE_FORMAT =DateFormat("yyyy-MM-dd");
  // static DateFormat API_DATE_FORMAT =DateFormat("dd/MM/yyyy");
  // static DateFormat API_DATE_FORMAT_UTS =DateFormat("MM/dd/yyyy");
  // static DateFormat DATE_CAL_FORMAT =DateFormat("yyyy, MM, dd");
}

