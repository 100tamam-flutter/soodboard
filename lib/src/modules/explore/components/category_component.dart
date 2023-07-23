import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:soodboard/src/modules/explore/models/category_model.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(21),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
              fixedSize: const Size(70, 70),
            ),
            onPressed: () {},
            child: SvgIcon(
              icon: SvgIconData(categoryModel.icon),
              size: 24,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            categoryModel.title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: const Color(0xFF9098B1),
                  letterSpacing: 0.5,
                ),
          ),
        ],
      ),
    );
  }
}
