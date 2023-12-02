import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/search_field.dart';

class SearchAppbar extends StatelessWidget {
  const SearchAppbar({
    super.key,
    required this.onTextChanged,
  });

  final Function(String) onTextChanged;

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
          Expanded(
            child: SSearchField(
              onTextChanged: onTextChanged,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          InkWell(
            child: SvgPicture.asset(
              'assets/icons/sort.svg',
              height: 24,
              width: 24,
            ),
          ),
          const SizedBox(width: 16),
          InkWell(
            child: SvgPicture.asset(
              'assets/icons/filter.svg',
              height: 24,
              width: 24,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
