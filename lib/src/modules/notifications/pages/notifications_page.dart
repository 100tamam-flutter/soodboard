import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/components/animated_sliver_list_view.dart';
import 'package:soodboard/src/constants/colors.dart';
import 'package:soodboard/src/core/localization.dart';
import 'package:vrouter/vrouter.dart';

import '../providers/notifications_provider.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationsProvider(context),
      child: const _NotificationsPage(),
    );
  }
}

class _NotificationsPage extends StatelessWidget {
  const _NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NotificationsProvider>();
    final staticProvider = context.read<NotificationsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.notificationsAppBar),
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
        child: provider.loadingStatus
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
                key: UniqueKey(),
                slivers: [
                  AnimatedSliverListView(
                    delay: const Duration(milliseconds: 100),
                    transitionType: TransitionType.slide,
                    children: [
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/icons/offer_blue.svg',
                          height: 24,
                        ),
                        title: const Text('Offer'),
                        trailing: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: AppColors.lightRed,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              provider.notificationStatus.newOffers.toString(),
                              style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        onTap: staticProvider.goToOffersScreen,
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/icons/list.svg',
                          height: 24,
                        ),
                        onTap: staticProvider.goToFeedPage,
                        title: const Text('Feed'),
                        trailing: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: AppColors.lightRed,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              provider.notificationStatus.newFeed.toString(),
                              style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/icons/notification_blue.svg',
                          height: 24,
                        ),
                        title: const Text('Activity'),
                        onTap: staticProvider.goToActivityPage,
                        trailing: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: AppColors.lightRed,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              provider.notificationStatus.newActivities.toString(),
                              style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
