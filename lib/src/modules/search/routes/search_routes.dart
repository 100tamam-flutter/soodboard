import 'package:vrouter/vrouter.dart';

import '../pages/search_page.dart';

List<VRouteElement> searchRoutes = [
  VPopHandler(
    onPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
    onSystemPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
    stackedRoutes: [
      VWidget(
        path: '/search',
        widget: const SearchPage(),
      ),
    ],
  ),
];
