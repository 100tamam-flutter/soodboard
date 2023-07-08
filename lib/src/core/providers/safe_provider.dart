import 'package:flutter/material.dart';

class SafeProvider extends ChangeNotifier {
  bool isSafe = true;

  @override
  void notifyListeners() {
    if (isSafe) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    isSafe = false;
    super.dispose();
  }
}
