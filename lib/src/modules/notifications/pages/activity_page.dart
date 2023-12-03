import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/constants/colors.dart';
import 'package:soodboard/src/core/localization.dart';
import 'package:soodboard/src/modules/notifications/providers/activity_provider.dart';
import 'package:vrouter/vrouter.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ActivityProvider(context),
      child: const _ActivityPage(),
    );
  }
}

class _ActivityPage extends StatelessWidget {
  const _ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ActivityProvider>();
    // final staticProvider = context.read<ActivityProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.activityAppBar),
        leading: Padding(
          padding: const EdgeInsets.all(16),
          child: InkWell(
            onTap: () => context.vRouter.pop(),
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        titleSpacing: 0,
        leadingWidth: 52,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        child: provider.loadingActivities
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: provider.activities.length,
                itemBuilder: (context, index) => ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/transaction.svg',
                    height: 24,
                  ),
                  title: Text(
                    provider.activities[index].title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider.activities[index].content,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.grey,
                            ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        DateFormat.yMMMMd('en_US').format(provider.activities[index].createdAt) +
                            DateFormat.jm().format(provider.activities[index].createdAt),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
