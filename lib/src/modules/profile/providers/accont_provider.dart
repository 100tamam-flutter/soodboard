import 'package:flutter/material.dart';
import 'package:soodboard/src/core/providers/safe_provider.dart';
import 'package:soodboard/src/utils/error_handler.dart';

class AccountProvider extends SafeProvider with ErrorHandler{
  final BuildContext context;
  AccountProvider(this.context);
}