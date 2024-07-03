import 'package:flutter/material.dart';

extension CustomTextTheme on BuildContext {
  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;

  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;

  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;

  TextStyle get displayLarge => Theme.of(this).textTheme.displayLarge!;

  TextStyle get displayMedium => Theme.of(this).textTheme.displayMedium!;

  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall!;

  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;

  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;

  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!;

  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;

  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;

  TextStyle get labelMedium => Theme.of(this).textTheme.labelMedium!;
}

extension GetTheme on BuildContext {
  ThemeData get getTheme => Theme.of(this);

  Color get splashColor => Theme.of(this).splashColor;
}
