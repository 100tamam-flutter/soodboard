import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/modules/profile/providers/accont_provider.dart';
import 'package:vrouter/vrouter.dart';

import '../providers/changename-provider.dart';

class ChangeNamePage extends StatelessWidget {
  const ChangeNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstName =
        context.vRouter.historyState['first_name'] ?? 'First Name';
    final lastName = context.vRouter.historyState['last_name'] ?? 'Last Name';

    return ChangeNotifierProvider(
      create: (context) => ChangeNameProvider(
        context,
        firstName,
        lastName,
      ),
      child: const _ChangeNamePage(),
    );
  }
}

class _ChangeNamePage extends StatelessWidget {
  const _ChangeNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ChangeNameProvider>();
    final staticProvider = context.read<ChangeNameProvider>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.vRouter.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Name',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF223263),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              color: Color(0xFFEBF0FF),
            ),
            Text(
              'First Name',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: staticProvider.firstName,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Last Name',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: staticProvider.lastName,
              ),
            ),
            const SizedBox(
              height: 381,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
