import 'package:soodboard/src/modules/profile/pages/addresses_page.dart';
import 'package:soodboard/src/modules/profile/pages/orders_page.dart';
import 'package:soodboard/src/modules/profile/pages/payments_page.dart';
import 'package:vrouter/vrouter.dart';

import '../pages/birthday_page.dart';
import '../pages/changename_page.dart';
import '../pages/changepasword_page.dart';
import '../pages/email_page.dart';
import '../pages/gender_page.dart';
import '../pages/phonenumbre_page.dart';
import '../pages/profile_page.dart';

List<VRouteElement> profileRoutes = [
  VPopHandler(
    onPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
    onSystemPop: (vRedirector) async => (vRedirector.historyCanBack()) ? vRedirector.historyBack() : vRedirector.pop(),
    stackedRoutes: [
      VWidget(
        path: '/profile',
        widget: const ProfilePage(),
      ),
      VWidget(
        path: '/change_name',
        widget: const ChangeNamePage(),
      ),
      VWidget(
        path: '/gender',
        widget: const GenderPage(),
      ),
      VWidget(
        path: '/birth_date',
        widget: const BirthDatePage(),
      ),
      VWidget(
        path: '/email',
        widget: const EmailPage(),
      ),
      VWidget(
        path: '/phone_number',
        widget: const PhoneNumber(),
      ),
      VWidget(
        path: '/change_password',
        widget: const ChangePassword(),
      ),
      VWidget(
        path: '/orders',
        widget: const OrdersPage(),
      ),
      VWidget(
        path: '/addresses',
        widget: const AddressesPage(),
      ),
      VWidget(
        path: '/payments',
        widget: const PaymentsPage(),
      ),
    ],
  ),
];
