import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vrouter/vrouter.dart';

import '../../../components/search_field.dart';

class SearchAppbar extends StatelessWidget {
  const SearchAppbar({
    super.key,
    required this.onTextChanged,
    required this.openSorts,
    required this.sortIsSelected,
    required this.openCategories,
    required this.categorySelected,
  });

  final Function(String) onTextChanged;
  final Function() openSorts;
  final bool sortIsSelected;
  final Function() openCategories;
  final bool categorySelected;

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
          IconButton(
            onPressed: () => context.vRouter.pop(),
            icon: SvgPicture.asset("assets/icons/Left.svg"),
          ),
          Expanded(
            child: SSearchField(
              onTextChanged: onTextChanged,
              autoFocus: true,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          InkWell(
            onTap: openSorts,
            child: SvgPicture.asset(
              sortIsSelected ? 'assets/icons/sort-blue.svg' : 'assets/icons/sort.svg',
              height: 24,
              width: 24,
            ),
          ),
          const SizedBox(width: 16),
          InkWell(
            onTap: openCategories,
            child: SvgPicture.asset(
              categorySelected ? 'assets/icons/filter-blue.svg' : 'assets/icons/filter.svg',
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
