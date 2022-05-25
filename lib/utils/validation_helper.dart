import 'package:flutter/services.dart';
import 'package:test/resources/app_strings.dart';

class ValidationHelper {
  static List<TextInputFormatter> allowCharactersOnly = <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(AppStrings.regexCharactersOnly))
  ];

  static List<TextInputFormatter> allowCharactersWithSpace =
      <TextInputFormatter>[
    FilteringTextInputFormatter.allow(
        RegExp(AppStrings.regexCharactersWithSpace))
  ];

  static List<TextInputFormatter> allowDigitsOnly = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly
  ];

  static bool isNumericString(String? s) {
    if (s == null) {
      return false;
    }

    return double.tryParse(s) != null;
  }

  static bool isValidString(String? strToValidate) {
    bool result = false;

    if (strToValidate != null &&
        strToValidate.trim() != 'null' &&
        strToValidate.trim().isNotEmpty) {
      result = true;
    }

    return result;
  }
}
