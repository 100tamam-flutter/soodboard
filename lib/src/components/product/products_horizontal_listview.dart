import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'product_tile_small.dart';
import '../../models/product_model.dart';

class ProductsHorizontalListView extends StatelessWidget {
  const ProductsHorizontalListView({
    super.key,
    required this.products,
    required this.title,
  });

  final List<ProductModel> products;
  final String title;

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
                title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: (){
                  context.vRouter.to('/offer', isReplacement: true);

                },
                child: Text(
                  "See More",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: const Color(0xFF40BFFF),
                      ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 238,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            children: products
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: ProductTileSmall(productModel: e),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
