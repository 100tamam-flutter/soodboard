import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/core/app_routes.dart';
import 'package:soodboard/src/modules/cart/providers/cart_providers.dart';
import 'package:vrouter/vrouter.dart';

import '../utils/soodboard_theme.dart';
import 'localization.dart';

class SoodBoard extends StatelessWidget {
  const SoodBoard({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // or Brightness.light
      ),
    );
    return MultiProvider(
      providers: <ChangeNotifierProvider<dynamic>>[
        ChangeNotifierProvider<LocaleProvider>(
          create: (_) => LocaleProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (_) => CartProvider(),
        ),
      ],
      child: const _SoodBoard(),
    );
  }
}

class _SoodBoard extends StatelessWidget {
  const _SoodBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VRouter(
      title: 'Flutter Demo',
      theme: SoodBoardTheme.light,
      debugShowCheckedModeBanner: false,
      locale: context.watch<LocaleProvider>().locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      mode: VRouterMode.history,
      initialUrl: '/splash',
      routes: appRoutes,
      buildTransition: (animation, animation2, child) => FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
