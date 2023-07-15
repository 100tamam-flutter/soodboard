import 'package:flutter/material.dart';

import '../models/error_template.dart';

mixin ErrorHandler {
  void showError(BuildContext context, ApiError e) {
    final scaffoldMessengerState = ScaffoldMessenger.of(context);
    scaffoldMessengerState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(e.message),
      ),
    );
  }

  void showWarning(
      {required BuildContext context, String message = 'عملیات ناموفق'}) {
    final scaffoldMessengerState = ScaffoldMessenger.of(context);
    scaffoldMessengerState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.orange,
        content: Text(message),
      ),
    );
  }

  void showSuccessMessage(
      {required BuildContext context, String message = 'عملیات موفق'}) {
    final scaffoldMessengerState = ScaffoldMessenger.of(context);
    scaffoldMessengerState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(message),
      ),
    );
  }
}
