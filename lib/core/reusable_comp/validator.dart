// ignore_for_file: file_names

import 'package:recogenie_task/core/constant.dart';
import 'package:recogenie_task/core/utils/app_strings.dart';

abstract class Validator {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emailCantBeEmpty;
    }
    if (!RegExp(Constant.regExValidateEmail).hasMatch(value)) {
      return AppStrings.enterValidEmailAddress;
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordCantBeEmpty;
    }
    if (value.length < 6) {
      return AppStrings.passwordMustBeAtLeast6Characters;
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return AppStrings.passwordMustContainAtLeastOneUppercaseLetter;
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return AppStrings.passwordMustContainAtLeastOneNumber;
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return AppStrings.passwordMustContainAtLeastOneSpecialCharacter;
    }
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordCantBeEmpty;
    }

    if (value != password) {
      return AppStrings.passwordsDoNotMatch;
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.userNameCannotBeEmpty;
    }
    if (value.length > 20) {
      return AppStrings.userNameCannotBeMoreThan20Characters;
    }
    return null;
  }
}
