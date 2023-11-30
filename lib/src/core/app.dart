import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/modules/cart/providers/cart_providers.dart';
import 'package:soodboard/src/modules/dashboard/pages/dashboard_page.dart';
import 'package:soodboard/src/modules/home_screen/pages/home_screen_page.dart';
import 'package:soodboard/src/modules/login/routes/login_routes.dart';
import 'package:soodboard/src/modules/offer_screen/pages/offer_screen_page.dart';
import 'package:soodboard/src/modules/profile/pages/birthday_page.dart';
import 'package:soodboard/src/modules/profile/pages/changename_page.dart';
import 'package:soodboard/src/modules/profile/pages/changepasword_page.dart';
import 'package:soodboard/src/modules/profile/pages/email_page.dart';
import 'package:soodboard/src/modules/profile/pages/gender_page.dart';
import 'package:soodboard/src/modules/profile/pages/phonenumbre_page.dart';
import 'package:soodboard/src/modules/profile/pages/profile_page.dart';
import 'package:vrouter/vrouter.dart';

import '../modules/cart/pages/cart_pages.dart';
import '../modules/explore/pages/explore_pages.dart';
import '../modules/product-details/pages/product_details_page.dart';
import '../modules/profile/pages/account_page.dart';
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
          VNester(
            path: '/',
            widgetBuilder: (child) => DashboardPage(
              child: child,
            ),
            nestedRoutes: [
              VWidget(
                path: null,
                widget: const HomeScreen(),
              ),
              VPopHandler(
                onPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
                onSystemPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
                stackedRoutes: [
                  VWidget(
                    path: 'explore',
                    widget: const ExplorePage(),
                  ),
                ],
              ),
              VPopHandler(
                onPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
                onSystemPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
                stackedRoutes: [
                  VWidget(
                    path: 'cart',
                    widget: const CartPage(),
                  ),
                ],
              ),
              VPopHandler(
                onPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
                onSystemPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
                stackedRoutes: [
                  VWidget(
                    path: 'offer',
                    widget: const OfferScreen(),
                  ),
                ],
              ),
              VPopHandler(
                onPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
                onSystemPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
                stackedRoutes: [
                  VWidget(
                    path: 'account',
                    widget: const AccountPage(),
                    stackedRoutes: [
                      VWidget(
                        path: 'profile',
                        widget: const ProfilePage(),
                        stackedRoutes: [
                          VWidget(
                            path: 'change_name',
                            widget: const ChangeNamePage(),
                          ),
                          VWidget(
                            path: 'gender',
                            widget: const GenderPage(),
                          ),
                          VWidget(
                            path: 'birth_date',
                            widget: const BirthDatePage(),
                          ),
                          VWidget(
                            path: 'email',
                            widget: const EmailPage(),
                          ),
                          VWidget(
                            path: 'phone_number',
                            widget: const PhoneNumber(),
                          ),
                          VWidget(
                            path: 'change_password',
                            widget: const ChangePassword(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          VPopHandler(
            onPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
            onSystemPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
            stackedRoutes: [
              VWidget(
                path: '/product_detail',
                widget: const ProductDetailsPage(),
              ),
            ],
          ),
        ] +
        loginRoutes;
  }
}
