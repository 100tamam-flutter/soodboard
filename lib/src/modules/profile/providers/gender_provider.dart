import 'package:flutter/material.dart';
import 'package:soodboard/src/core/providers/safe_provider.dart';
import 'package:soodboard/src/utils/error_handler.dart';

class GenderProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;
  final String gender;

  GenderProvider(
    this.context,
    this.gender,
  );
}
