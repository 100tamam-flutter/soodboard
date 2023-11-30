import 'package:soodboard/src/modules/notifications/pages/feed_page.dart';
import 'package:soodboard/src/modules/notifications/pages/notifications_page.dart';
import 'package:soodboard/src/modules/notifications/pages/offers_page.dart';
import 'package:vrouter/vrouter.dart';

List<VRouteElement> notificationsRoutes = [
  VPopHandler(
    onPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
    onSystemPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
    stackedRoutes: [
      VWidget(path: '/notifications', widget: const NotificationsPage(), stackedRoutes: [
        VPopHandler(
          onPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
          onSystemPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
          stackedRoutes: [
            VWidget(
              path: 'offers',
              widget: const OffersPage(),
            ),
            VWidget(
              path: 'feed',
              widget: const FeedPage(),
            ),
          ],
        ),
      ]),
    ],
  ),
];
