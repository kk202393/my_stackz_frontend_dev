import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.bgColor,
    cardColor: AppColors.white,
    appBarTheme: AppBarTheme(
        elevation: 0,
        color: AppColors.bgColor,
        iconTheme: const IconThemeData(color: AppColors.black),
        titleTextStyle: GoogleFonts.montserrat(
            color: AppColors.primaryButtonColor,
            fontWeight: FontWeight.w700,
            fontSize: 18)),
    iconTheme: const IconThemeData(color: AppColors.black, size: 20),
    textTheme: TextTheme(
        headlineLarge: GoogleFonts.montserrat(
            fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.black),
        headlineMedium: GoogleFonts.montserrat(
            fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.black),
        headlineSmall: GoogleFonts.montserrat(
            fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.black),
        displayLarge: GoogleFonts.montserrat(
            fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.black),
        displayMedium: GoogleFonts.montserrat(
            fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.black),
        displaySmall: GoogleFonts.montserrat(
            fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.black),
        bodyLarge: GoogleFonts.montserrat(
            fontSize: 24, fontWeight: FontWeight.w400, color: AppColors.black),
        bodyMedium: GoogleFonts.montserrat(
            fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.black),
        bodySmall: GoogleFonts.montserrat(
            fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.black),
        titleLarge: GoogleFonts.montserrat(
            fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.black),
        titleMedium: GoogleFonts.montserrat(
            fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.black),
        titleSmall: GoogleFonts.montserrat(
            fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.black),
        labelLarge: GoogleFonts.montserrat(
            fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.black),
        labelMedium: GoogleFonts.montserrat(
            fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.black),
        labelSmall: GoogleFonts.montserrat(
            fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.black)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      elevation: MaterialStateProperty.all(10),
      shadowColor: MaterialStateProperty.all<Color>(
          AppColors.primaryButtonColor.withOpacity(0.4)),
      backgroundColor:
          MaterialStateProperty.all<Color>(AppColors.primaryButtonColor),
      padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 20)),
      textStyle: MaterialStateProperty.all<TextStyle>(GoogleFonts.montserrat(
          fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.black)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    )),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all<Color>(AppColors.white),
      trackColor: MaterialStateProperty.all<Color>(AppColors.white),
      overlayColor: MaterialStateProperty.all<Color>(AppColors.white),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppColors.black,
    splashColor: AppColors.black,
    cardColor: AppColors.black,
    indicatorColor: AppColors.white,
    appBarTheme: AppBarTheme(
        elevation: 0,
        color: AppColors.black,
        iconTheme: const IconThemeData(color: AppColors.white),
        titleTextStyle: GoogleFonts.montserrat(
            color: AppColors.white, fontWeight: FontWeight.w700, fontSize: 18)),
    iconTheme: const IconThemeData(color: AppColors.white, size: 20),
    textTheme: TextTheme(
        headlineLarge: GoogleFonts.montserrat(
            fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.white),
        headlineMedium: GoogleFonts.montserrat(
            fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.white),
        headlineSmall: GoogleFonts.montserrat(
            fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.white),
        displayLarge: GoogleFonts.montserrat(
            fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.white),
        displayMedium: GoogleFonts.montserrat(
            fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.white),
        displaySmall: GoogleFonts.montserrat(
            fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.white),
        bodyLarge: GoogleFonts.montserrat(
            fontSize: 24, fontWeight: FontWeight.w400, color: AppColors.white),
        bodyMedium: GoogleFonts.montserrat(
            fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.white),
        bodySmall: GoogleFonts.montserrat(
            fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.white),
        titleLarge: GoogleFonts.montserrat(
            fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.white),
        titleMedium: GoogleFonts.montserrat(
            fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.white),
        titleSmall: GoogleFonts.montserrat(
            fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.white),
        labelLarge: GoogleFonts.montserrat(
            fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.white),
        labelMedium: GoogleFonts.montserrat(
            fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.white),
        labelSmall: GoogleFonts.montserrat(
            fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.white)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryButtonColor),
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(vertical: 20)),
          textStyle: MaterialStateProperty.all<TextStyle>(GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.black)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all<Color>(AppColors.white),
      trackColor: MaterialStateProperty.all<Color>(AppColors.white),
      overlayColor: MaterialStateProperty.all<Color>(AppColors.white),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );
}
