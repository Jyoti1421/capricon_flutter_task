import 'package:capricon_flutter_task/constant/string_constant.dart';

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return StringConstants.pleaseEnterYourEmail;
    } else if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(value)) {
      return StringConstants.pleaseEnterValidEmail;
    }
    return null; // No error if valid
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return StringConstants.pleaseEnterYourPassword;
    } else if (value.length < 6) {
      return StringConstants.passwordMustbeSixchar;
    }
    return null;
  }
}
