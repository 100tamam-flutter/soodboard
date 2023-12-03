import 'package:vrouter/vrouter.dart';

import '../pages/product_details_page.dart';

List<VRouteElement> productDetailRoutes = [
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
];
