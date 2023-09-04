import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/modules/home_screen/pages/home_screen_page.dart';
import 'package:soodboard/src/modules/login/pages/login_page.dart';
import 'package:soodboard/src/modules/offer_screen/pages/offer_screen_page.dart';
import 'package:vrouter/vrouter.dart';

import '../modules/explore/pages/explore_pages.dart';
import '../modules/favorite/pages/favorite_products_page.dart';
import '../modules/splash/pages/splash_page.dart';
import '../utils/soodboard_theme.dart';
import 'localization.dart';

class SoodBoard extends StatelessWidget {
  const SoodBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <ChangeNotifierProvider<dynamic>>[
        ChangeNotifierProvider<LocaleProvider>(
          create: (_) => LocaleProvider(),
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
      initialUrl: '/offer_screen',
      routes: routes,
      buildTransition: (animation, _, child) => FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }

  List<VRouteElement> get routes {
    return [
      VWidget(
        path: '/splash',
        widget: const SplashPage(),
        transitionDuration: Duration.zero,
      ),
      VWidget(
        path: '/login',
        widget: const LoginPage(),
      ),
      VWidget(
        path: '/favorite_products',
        widget: const FavoriteProductsPage(),
      ),
      VWidget(
          path: '/home_screen',
          widget: const HomeScreen(),
      ),
      VWidget(
        path: '/explore',
        widget: const ExplorePage(),
      ),
      VWidget(
        path: '/offer_screen',
        widget: const OfferScreen(),
      ),
    ];
  }
}
