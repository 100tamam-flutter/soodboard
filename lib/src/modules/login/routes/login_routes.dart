import 'package:soodboard/src/modules/login/pages/forgot_password_page.dart';
import 'package:soodboard/src/modules/login/pages/register_page.dart';
import 'package:vrouter/vrouter.dart';

import '../pages/login_page.dart';

List<VRouteElement> loginRoutes = [
  VPopHandler(
    onPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
    onSystemPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
    stackedRoutes: [
      VWidget(
        path: '/login',
        widget: const LoginPage(),
      ),
      VWidget(
        path: '/forgot_password',
        widget: const ForgotPasswordPage(),
      ),
      VWidget(
        path: '/register',
        widget: const RegisterPage(),
      ),
    ],
  ),
];
