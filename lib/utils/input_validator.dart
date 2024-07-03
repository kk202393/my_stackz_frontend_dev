import '../constants/string_constants.dart';

class InputValidator {
  static String? isValidEmail(String email) {
    final regex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email.isEmpty) {
      return StringConstants.emailCantBeEmpty;
    } else if (regex.hasMatch(email)) {
      return null;
    } else {
      return StringConstants.enterValidEmail;
    }
  }

  static String? isValidPassword(String password) {
    final regex = RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+");
    if (password.isEmpty) {
      return StringConstants.passwordCantBeEmpty;
    } else if (regex.hasMatch(password)) {
      return null;
    } else {
      return StringConstants.passwordMustContain;
    }
  }

  static String? validateConfirmPassword(
      String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return StringConstants.passwordCantBeEmpty;
    } else if (password == confirmPassword) {
      return null;
    } else {
      return StringConstants.passwordMustMatch;
    }
  }

  static String? validateFields(String field, String value) {
    if (value.isEmpty) {
      return '$field can\'t be empty';
    } else {
      return null;
    }
  }

  static String? isValidPhoneNumber(String value) {
    final regex = RegExp(
        r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$');
    if (value.isEmpty) {
      return StringConstants.pleaseEnterPhoneNumber;
    } else if (!regex.hasMatch(value)) {
      return StringConstants.pleaseEnterValidPhoneNumber;
    } else {
      return null;
    }
  }
}
