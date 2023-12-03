import 'package:soodboard/src/modules/dashboard/routes/dashboard_routes.dart';
import 'package:soodboard/src/modules/favorite/routes/favorite_products_routes.dart';
import 'package:soodboard/src/modules/login/routes/login_routes.dart';
import 'package:soodboard/src/modules/product-details/routes/product_detail_routes.dart';
import 'package:soodboard/src/modules/splash/routes/splash_routes.dart';
import 'package:vrouter/vrouter.dart';

import '../modules/more_products/routes/more_products_routes.dart';
import '../modules/notifications/routes/notifications_routes.dart';
import '../modules/profile/routes/profile_routes.dart';
import '../modules/search/routes/search_routes.dart';

List<VRouteElement> get appRoutes {
  return splashRoutes +
      productDetailRoutes +
      dashboardRoutes +
      loginRoutes +
      favoriteProductsRoutes +
      notificationsRoutes +
      searchRoutes +
      moreProductsRoutes +
      profileRoutes;
}
