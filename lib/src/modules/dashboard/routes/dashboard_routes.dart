import 'package:vrouter/vrouter.dart';

import '../../cart/pages/cart_pages.dart';
import '../../explore/pages/explore_pages.dart';
import '../../home/pages/home_screen_page.dart';
import '../../notifications/pages/offers_page.dart';
import '../../profile/pages/account_page.dart';
import '../pages/dashboard_page.dart';

List<VRouteElement> dashboardRoutes = [
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
            widget: const OffersPage(),
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
          ),
        ],
      ),
    ],
  ),
];
