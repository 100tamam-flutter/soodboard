import 'package:vrouter/vrouter.dart';

import '../pages/splash_page.dart';

List<VRouteElement> splashRoutes = [
  VWidget(
    path: '/splash',
    widget: const SplashPage(),
    transitionDuration: Duration.zero,
  ),
];
