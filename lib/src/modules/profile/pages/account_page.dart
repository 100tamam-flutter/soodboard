import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/modules/profile/providers/accont_provider.dart';
import 'package:vrouter/vrouter.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AccountProvider(context),
      child: const _AccountPage(),
    );
  }
}

class _AccountPage extends StatelessWidget {
  const _AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF223263),
          ),
        ),
      ),
      body: ListView(
        children: [
          const Divider(
            color: Color(0xFFEBF0FF),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/icons/person.svg'),
            minVerticalPadding: 16,
            title: Text(
              'Profile',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () => context.vRouter.to('profile'),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/icons/bag.svg'),
            minVerticalPadding: 16,
            title: Text(
              'Order',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/icons/Location.svg'),
            minVerticalPadding: 16,
            title: Text(
              'Address',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/icons/Credit_Card.svg'),
            minVerticalPadding: 16,
            title: Text(
              'Payment',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
