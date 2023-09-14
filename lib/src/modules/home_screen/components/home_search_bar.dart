
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/search_field.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
          onTap: () {},
        ),
        const SizedBox(width: 16),
        InkWell(
          child: SvgPicture.asset(
            'assets/icons/notification.svg',
            height: 24,
            width: 24,
          ),
          onTap: () {},
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
