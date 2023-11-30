import 'package:soodboard/src/modules/notifications/pages/notifications_page.dart';
import 'package:vrouter/vrouter.dart';

List<VRouteElement> notificationsRoutes = [
  VPopHandler(
    onPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
    onSystemPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
    stackedRoutes: [
      VWidget(
        path: '/notifications',
        widget: const NotificationsPage(),
      ),
    ],
  ),
];
