import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';
import '../providers/birthday_provider.dart';
import '../providers/gender_provider.dart';


class BirthDatePage extends StatelessWidget {
  const BirthDatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final birthDate = context.vRouter.historyState['birth_date'] ?? 'male';
    return ChangeNotifierProvider(
      create: (context) => BirthDateProvider(context, birthDate),
      child: const _BirthDayPage(),
    );
  }
}

class _BirthDayPage extends StatelessWidget {
  const _BirthDayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BirthDateProvider>();
    final staticProvider = context.read<BirthDateProvider>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.vRouter.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Birthday',
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
              'Your Birthday',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: staticProvider.birthdate,
              ),
            ),
            const SizedBox(
              height: 486,
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