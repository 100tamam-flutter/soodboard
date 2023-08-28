import 'package:flutter/material.dart';
import 'package:soodboard/src/core/localization.dart';
import 'package:vrouter/vrouter.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkTokens();
  }

  Future<void> checkTokens() async {
    await Future.delayed(const Duration(seconds: 2));
    goToDashboardPage();
  }

  void goToDashboardPage() {
    context.vRouter.to('/dashboard', isReplacement: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.localizations.appName,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              context.localizations.slogan,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
