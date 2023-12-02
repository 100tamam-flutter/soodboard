import 'package:flutter/material.dart';

import '../../explore/components/category_component.dart';
import '../../explore/models/category_model.dart';

class CategoriesPanel extends StatelessWidget {
  const CategoriesPanel({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                "Category",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Expanded(child: Container()),
              Text(
                "More Category",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: const Color(0xFF40BFFF),
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 12),
            children: categories
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: CategoryComponent(categoryModel: e),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
