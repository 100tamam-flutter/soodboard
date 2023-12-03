import 'package:soodboard/src/modules/product-details/pages/add_review_page.dart';
import 'package:soodboard/src/modules/product-details/pages/product_reviews_page.dart';
import 'package:vrouter/vrouter.dart';

import '../pages/product_details_page.dart';

List<VRouteElement> productDetailRoutes = [
  VPopHandler(
    onPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
    onSystemPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
    stackedRoutes: [
      VWidget(
        path: '/product_detail/:id',
        widget: const ProductDetailsPage(),
      ),
      VWidget(
        path: '/reviews/:id',
        widget: const ProductReviewsPage(),
      ),
      VWidget(
        path: '/add_review/:id',
        widget: const AddReviewPage(),
      ),
    ],
  ),
];
