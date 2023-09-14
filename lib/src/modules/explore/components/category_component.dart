import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soodboard/src/modules/explore/models/category_model.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
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
            child: SvgPicture.asset(
              categoryModel.icon,
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            categoryModel.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
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
