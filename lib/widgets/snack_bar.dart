// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:my_stackz/themes/custom_text_theme.dart';

// import '../constants/app_colors.dart';
// import 'text_widget.dart';

// const kPadding = 8.0; // up to you

// class Snack {
//   /// show the snack bar
//   /// [content] is responsible for the text of the snack bar
//   static show({
//     required String content,
//     SnackType snackType = SnackType.info,
//     SnackBarBehavior behavior = SnackBarBehavior.fixed,
//    // required BuildContext context,
//     BuildContext? context,
//   }) {

    
//     ScaffoldMessenger.of(context!).removeCurrentSnackBar();
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: TextWidget(
//             text: content,
//             style: context.displaySmall.copyWith(
//                 color: _getSnackBarTextColor(snackType),
//                 fontWeight: FontWeight.w500)),
//         behavior: behavior,
//         backgroundColor: _getSnackBarColor(snackType),
//         padding: const EdgeInsets.symmetric(
//             horizontal: kPadding * 3, vertical: kPadding * 2)));
//   }

//   static Color _getSnackBarColor(SnackType type) {
//     if (type == SnackType.error) return AppColors.redPigment;
//     if (type == SnackType.warning) return AppColors.princeTonOrange;
//     if (type == SnackType.info) return AppColors.greenCrayola;
//     return AppColors.white;
//   }

//   static Color _getSnackBarTextColor(SnackType type) {
//     if (type == SnackType.error || type == SnackType.info) return Colors.black;

//     return const Color(0xff1C1C1C);
//   }
// }

// enum SnackType { info, warning, error, success }


import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'text_widget.dart';

const kPadding = 8.0; 

class Snack {
  /// Show the SnackBar
  /// [content] is responsible for the text of the SnackBar
  static show({
    required String content,
    SnackType snackType = SnackType.info,
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
    BuildContext? context, 
  }) {
    if (context == null) {
      
      print('Context is null, cannot show SnackBar');
      return;
    }

    
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: TextWidget(
        text: content,
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: _getSnackBarTextColor(snackType),
              fontWeight: FontWeight.w500,
            ) ??
            TextStyle( 
              color: _getSnackBarTextColor(snackType),
              fontWeight: FontWeight.w500,
            ),
      ),
      behavior: behavior,
      backgroundColor: _getSnackBarColor(snackType),
      padding: const EdgeInsets.symmetric(
        horizontal: kPadding * 3,
        vertical: kPadding * 2,
      ),
    ));
  }

  static Color _getSnackBarColor(SnackType type) {
    if (type == SnackType.error) return AppColors.redPigment;
    if (type == SnackType.warning) return AppColors.princeTonOrange;
    if (type == SnackType.info) return AppColors.greenCrayola;
    return AppColors.white;
  }

  static Color _getSnackBarTextColor(SnackType type) {
    if (type == SnackType.error || type == SnackType.info) return Colors.black;
    return const Color(0xff1C1C1C); 
  }
}

enum SnackType { info, warning, error, success }
