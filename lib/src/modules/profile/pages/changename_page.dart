import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        elevation: 0,
        title: const Text(
          'Name',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'First Name',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    style: Theme.of(context).textTheme.labelLarge,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
                      ),
                      hintStyle: Theme.of(context).textTheme.labelLarge,
                      hintText: provider.firstName,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  Text(
                    'Last Name',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    style: Theme.of(context).textTheme.labelLarge,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
                      ),
                      hintStyle: Theme.of(context).textTheme.labelLarge,
                      hintText: provider.lastName,
                    ),
                  ),
                ],
              ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Save',
                      style:
                      Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
