import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';
import '../providers/gender_provider.dart';

class GenderPage extends StatelessWidget {
  const GenderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gender = context.vRouter.historyState['gender'] ?? 'male';
    return ChangeNotifierProvider(
      create: (context) => GenderProvider(context, gender),
      child: const _GenderPage(),
    );
  }
}

class _GenderPage extends StatelessWidget {
  const _GenderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GenderProvider>();
    final staticProvider = context.read<GenderProvider>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.vRouter.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        title: const Text(
          'Gender',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Choose Gender',
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
                    hintText: staticProvider.gender,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
            )
          ],
        ),
      ),
    );
  }
}
