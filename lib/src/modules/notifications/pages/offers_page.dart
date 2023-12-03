import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/constants/colors.dart';
import 'package:soodboard/src/core/localization.dart';
import 'package:vrouter/vrouter.dart';

import '../providers/offer_provider.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OfferProvider(context),
      child: const _OffersPage(),
    );
  }
}

class _OffersPage extends StatelessWidget {
  const _OffersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OfferProvider>();
    // final staticProvider = context.read<OfferProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.offersAppBar),
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
        child: provider.loadingOffers
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: provider.offers.length,
                itemBuilder: (context, index) => ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/offer_blue.svg',
                    height: 24,
                  ),
                  title: Text(
                    provider.offers[index].title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider.offers[index].content,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.grey,
                            ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        DateFormat.yMMMMd('en_US').format(provider.offers[index].createdAt) +
                            DateFormat.jm().format(provider.offers[index].createdAt),
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
