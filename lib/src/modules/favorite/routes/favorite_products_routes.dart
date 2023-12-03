import 'package:vrouter/vrouter.dart';

import '../pages/favorite_products_page.dart';

List<VRouteElement> favoriteProductsRoutes = [
  VPopHandler(
    onPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
    onSystemPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
    stackedRoutes: [
      VWidget(
        path: '/favorite_products',
        widget: const FavoriteProductsPage(),
      ),
    ],
  ),
];
