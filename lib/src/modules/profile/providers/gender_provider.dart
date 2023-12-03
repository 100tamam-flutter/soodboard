import 'package:flutter/material.dart';
import 'package:soodboard/src/core/providers/safe_provider.dart';
import 'package:soodboard/src/utils/error_handler.dart';

class GenderProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;
  final String gender;

  GenderProvider(
    this.context,
    this.gender,
  ) {
    genderValue = gender;
  }

  List<String> genders = ['male', 'female'];
  late String genderValue;

  changeValue(String? newGender) {
    genderValue = newGender!;
    notifyListeners();
  }
}
