import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';

import '../constants/app_colors.dart';
import '../constants/string_constants.dart';

class AppFormField extends StatelessWidget {
  final String hintText;
  final double fontSize;
  final double borderRadius;
  final FontWeight fontWeight;
  final Color fillColor;
  final Color borderColor;
  final Color textColor;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final onChangeCountry;
  final FormFieldValidator? validator;
  final EdgeInsets contentPadding;
  final bool showPrefix;
  final bool isPhoneNumber;
  final bool obscureText;
  final int maxLines;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final GestureTapCallback? onTapSuffixIcon;
  final int? maxLength;

  const AppFormField(
      {super.key,
      this.hintText = '',
      this.fontSize = 12,
      this.borderRadius = 8,
      this.fontWeight = FontWeight.w400,
      this.fillColor = AppColors.white,
      this.textColor = AppColors.black,
      this.borderColor = AppColors.black,
      required this.controller,
      this.onChanged,
      this.onChangeCountry,
      this.validator,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      this.showPrefix = false,
      this.isPhoneNumber = false,
      this.maxLines = 1,
      this.prefixIcon,
      this.onTapSuffixIcon,
      this.keyboardType,
      this.maxLength,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    final border = UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)));
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      cursorColor: textColor,
      maxLength: maxLength,
      obscureText: obscureText,
      keyboardType: keyboardType ?? TextInputType.text,
      style: GoogleFonts.openSans(
          fontSize: fontSize, fontWeight: fontWeight, color: textColor),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          prefixIcon: isPhoneNumber
              ? CountryCodePicker(
                  onChanged: onChangeCountry,
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: 'IN',
                  favorite: const ['+91', 'IN'],
                  // optional. Shows only country name and flag
                  showCountryOnly: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                  // optional. aligns the flag and the Text left
                  alignLeft: false,
                  showFlag: false,
                )
              : showPrefix
                  ? Icon(prefixIcon ?? Icons.search,
                      color: AppColors.black.withOpacity(0.5))
                  : null,
          suffixIcon: hintText == StringConstants.enterPassword ||
                  hintText == StringConstants.confirmPassword
              ? InkWell(
                  onTap: onTapSuffixIcon,
                  child: Icon(
                      obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 20,
                      color: AppColors.black.withOpacity(0.5)),
                )
              : null,
          labelText: hintText,
          labelStyle: context.labelMedium,
          hintText: hintText,
          hintStyle: GoogleFonts.openSans(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor.withOpacity(0.5)),
          errorMaxLines: 4,
          contentPadding: contentPadding,
          border: border,
          focusedBorder: border,
          errorBorder: border,
          enabledBorder: border),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
