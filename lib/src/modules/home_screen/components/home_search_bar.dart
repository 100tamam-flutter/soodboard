import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vrouter/vrouter.dart';

import '../../../components/search_field.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          const Expanded(child: SSearchField()),
          const SizedBox(
            width: 16,
          ),
          InkWell(
            child: SvgPicture.asset(
              'assets/icons/love.svg',
              height: 24,
              width: 24,
            ),
            onTap: () => context.vRouter.to('/favorite_products'),
          ),
          const SizedBox(width: 16),
          InkWell(
            child: SvgPicture.asset(
              'assets/icons/notification.svg',
              height: 24,
              width: 24,
            ),
            onTap: () => context.vRouter.to('/notifications'),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
