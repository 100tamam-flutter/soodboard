import 'package:flutter/material.dart';
import 'package:soodboard/src/modules/explore/components/category_component.dart';

import '../models/category_model.dart';

class CategoryTableComponent extends StatelessWidget {
  const CategoryTableComponent(
      {Key? key, required this.title, required this.categories})
      : super(key: key);
  final String title;
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                 color: const Color(0xFF223263),
                ),
              ),
            ],
          ),
          Wrap(
            alignment: WrapAlignment.start,
              children: categories
                  .map((e) => CategoryComponent(
                        categoryModel: e,
                      ))
                  .toList()),
        ],
      ),
    );
  }
}
