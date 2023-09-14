import 'package:flutter/material.dart';
import 'package:soodboard/src/core/providers/safe_provider.dart';
import 'package:soodboard/src/utils/error_handler.dart';

class ChangeNameProvider extends SafeProvider with ErrorHandler{
  final BuildContext context;
  final String firstName;
  final String lastName;
  ChangeNameProvider(this.context, this.firstName, this.lastName);


}
