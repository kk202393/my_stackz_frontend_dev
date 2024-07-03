import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/app_colors.dart';

class AppTextFieldSearch extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final bool isRequiredField;
  final EdgeInsetsDirectional padding;
  final EdgeInsets contentPadding;
  final bool isPhoneNumber;
  final FormFieldValidator<String> validator;
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final int maxLength;
  final int maxLines;
  final double fontSize;
  final double borderRadius;
  final Color textColor;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final VoidCallback? onIconPressed;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final bool readOnly;
  final bool isTyped;

  const AppTextFieldSearch(
      {Key? key,
      this.label = '',
      this.hint = '',
      required this.keyboardType,
      this.isRequiredField = false,
      this.padding = const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      this.contentPadding = const EdgeInsets.all(15),
      this.isPhoneNumber = false,
      required this.validator,
      required this.formKey,
      required this.controller,
      this.maxLength = 250,
      this.maxLines = 1,
      this.fontSize = 16,
      this.borderRadius = 30,
      this.textColor = AppColors.white,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal,
      this.fontStyle = FontStyle.normal,
      this.obscureText = false,
      this.readOnly = false,
      this.isTyped = false,
      this.onIconPressed,
      this.onChanged,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: AppColors.black.withOpacity(0.1)));
    OutlineInputBorder focussedBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: AppColors.black.withOpacity(0.1)));
    OutlineInputBorder errorBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: AppColors.black.withOpacity(0.1)));
    return TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            fillColor: AppColors.white,
            filled: true,
            counter: const Offstage(),
            prefixIcon: IconButton(
                icon: Icon(Icons.search,
                    color: AppColors.princeTonOrange.withOpacity(0.5)),
                onPressed: onIconPressed),
            suffixIcon: isTyped? IconButton(
                icon: const Icon(Icons.close_outlined),
                onPressed: onIconPressed) : null,
            isDense: true,
            contentPadding: contentPadding,
            hintText: hint,
            hintStyle: GoogleFonts.nunito(
                fontWeight: FontWeight.normal,
                color: AppColors.darkGray,
                fontSize: fontSize),
            errorStyle: GoogleFonts.nunito(
                fontWeight: FontWeight.normal, color: AppColors.redPigment),
            errorMaxLines: 2,
            border: border,
            disabledBorder: border,
            enabledBorder: border,
            errorBorder: errorBorder,
            focusedErrorBorder: focussedBorder,
            focusedBorder: focussedBorder),
        style: GoogleFonts.nunito(
            fontWeight: FontWeight.w400,
            color: AppColors.black,
            fontSize: fontSize),
        autocorrect: false,
        textInputAction: TextInputAction.done,
        obscureText: obscureText,
        maxLines: maxLines,
        maxLength: maxLength,
        validator: validator,
        onChanged: onChanged,
        onSaved: (value) {
          formKey.currentState?.save();
          formKey.currentState?.validate();
        });
  }
}
