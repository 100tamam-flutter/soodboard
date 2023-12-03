import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vrouter/vrouter.dart';

class AddressesPage extends StatelessWidget {
  const AddressesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.vRouter.pop(),
            icon: SvgPicture.asset("assets/icons/Left.svg"),
          ),
          title: const Text(
            'Address',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF223263),
            ),
          ),
        ),
        body: const Center(
          child: Text('Addresses will appear here'),
        ));
  }
}
