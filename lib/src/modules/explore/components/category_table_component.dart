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
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          Wrap(
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
