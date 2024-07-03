import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class SettingsTextField extends StatelessWidget {
  final String hint;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final bool isEditedField;
  final bool showCloseIcon;
  final EdgeInsets contentPadding;
  final FormFieldValidator<String> validator;
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final int maxLength;
  final int maxLines;
  final double fontSize;
  final double borderRadius;
  final Color textColor;
  final Color hintColor;
  final Color labelColor;
  final Color fillColor;
  final Color borderColor;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final GestureTapCallback? onIconPressed;
  final GestureTapCallback? onTap;
  final bool obscureText;
  final FloatingLabelBehavior floatingLabelBehavior;
  final IconData? iconData;
  final ValueChanged<String>? onChanged;

  const SettingsTextField(
      {Key? key,
      this.hint = '',
      required this.keyboardType,
      this.inputFormatters = const <TextInputFormatter>[],
      this.isEditedField = false,
      this.showCloseIcon = false,
      this.contentPadding = const EdgeInsets.all(15),
      required this.validator,
      required this.formKey,
      required this.controller,
      this.maxLength = 250,
      this.maxLines = 1,
      this.fontSize = 14,
      this.borderRadius = 12,
      this.textColor = AppColors.black,
      this.hintColor = AppColors.gray,
      this.labelColor = AppColors.gray,
      this.fillColor = AppColors.white,
      this.borderColor = AppColors.primaryButtonColor,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.w700,
      this.fontStyle = FontStyle.normal,
      this.obscureText = false,
      this.floatingLabelBehavior = FloatingLabelBehavior.never,
      this.onIconPressed,
      this.onTap,
      this.iconData,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: borderColor));
    OutlineInputBorder focussedBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: borderColor));
    OutlineInputBorder errorBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: borderColor));
    return TextFormField(
        onTap: onTap,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        controller: controller,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            filled: true,
            fillColor: fillColor,
            counter: const Offstage(),
            isDense: true,
            contentPadding: contentPadding,
            floatingLabelBehavior: floatingLabelBehavior,
            hintText: hint,
            hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.normal,
                color: hintColor,
                fontSize: fontSize),
            errorStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.normal, color: AppColors.redPigment),
            errorMaxLines: 2,
            border: border,
            disabledBorder: border,
            enabledBorder: border,
            errorBorder: errorBorder,
            focusedErrorBorder: focussedBorder,
            focusedBorder: focussedBorder),
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700, color: textColor, fontSize: fontSize),
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
