import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import '../../../core/providers/safe_provider.dart';
import '../../../utils/error_handler.dart';

class LoginProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  LoginProvider(this.context){
    showMockedDialog();
  }

  Future<void> showMockedDialog() async {
    await Future.delayed(const Duration(seconds: 1));
    _showMockedDialog();
  }

  void _showMockedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        content: const Text(
          'This is a demonstration version of Soodboard, and the APIs are mocked for illustration purposes. Please note that there is no actual backend or database for users, products, purchases, etc. The data you see is simulated to showcase the functionality of the app. Feel free to explore and interact with the app features. If you have any questions or feedback, reach out to us at mani.rahmanzade@gmail.com.Thank you for trying out Soodboard Demo!',
        ),
        contentPadding: const EdgeInsets.all(32),
        actions: [
          ElevatedButton(onPressed: () => context.vRouter.pop(), child: const Text('Got It!')),
        ],
      ),
    );
  }
}
