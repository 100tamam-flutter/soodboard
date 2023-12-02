import 'package:vrouter/vrouter.dart';

import '../pages/more_products_page.dart';

List<VRouteElement> moreProductsRoutes = [
  VPopHandler(
    onPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
    onSystemPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
    stackedRoutes: [
      VWidget(
        path: '/more_products/:sort',
        widget: const MoreProductsPage(),
      ),
    ],
  ),
];
