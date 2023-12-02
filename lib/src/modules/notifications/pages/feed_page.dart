import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/constants/colors.dart';
import 'package:soodboard/src/core/localization.dart';
import 'package:vrouter/vrouter.dart';

import '../providers/feed_provider.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FeedProvider(context),
      child: const _FeedPage(),
    );
  }
}

class _FeedPage extends StatelessWidget {
  const _FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FeedProvider>();
    // final staticProvider = context.read<FeedProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.feedAppBar),
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
        child: provider.loadingFeeds
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: provider.feeds.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Image.asset(provider.feeds[index].image),
                  title: Text(
                    provider.feeds[index].title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider.feeds[index].content,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.grey,
                            ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        DateFormat.yMMMMd('en_US').format(provider.feeds[index].createdAt) +
                            DateFormat.jm().format(provider.feeds[index].createdAt),
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
