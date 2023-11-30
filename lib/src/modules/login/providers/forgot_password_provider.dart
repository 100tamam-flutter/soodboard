import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import '../../../core/providers/safe_provider.dart';
import '../../../utils/error_handler.dart';

class ForgotPasswordProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  ForgotPasswordProvider(this.context);

  void goToLoginPage() {
    context.vRouter.to('/login');
  }

  void goToRegisterPage() {
    context.vRouter.to('/register');
  }
}
