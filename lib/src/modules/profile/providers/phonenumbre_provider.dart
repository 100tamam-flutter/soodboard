import 'package:flutter/material.dart';
import 'package:soodboard/src/core/providers/safe_provider.dart';
import 'package:soodboard/src/utils/error_handler.dart';


class PhoneNumberProvider extends SafeProvider with ErrorHandler{
  final BuildContext context;
  final String phoneNumber;
  PhoneNumberProvider(this.context, this.phoneNumber,);
}