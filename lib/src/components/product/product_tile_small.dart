import 'package:flutter/material.dart';
import 'package:soodboard/src/constants/colors.dart';
import 'package:soodboard/src/models/product_model.dart';
import 'package:vrouter/vrouter.dart';

class ProductTileSmall extends StatelessWidget {
  const ProductTileSmall({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.vRouter.to('/product_detail/${productModel.id}'),
      child: Container(
        height: 238,
        width: 141,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFFEBF0FF),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              width: 141 - 32,
              child: Image.asset(
                productModel.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              productModel.title,
              style: Theme.of(context).textTheme.labelLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              productModel.price.toString(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: const Color(0xFF40BFFF),
                  ),
            ),
            Row(
              children: [
                Text(
                  productModel.previousPrice.toString(),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: const Color(0xFF9098B1),
                        decoration: TextDecoration.lineThrough,
                      ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '${productModel.discount}%',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppColors.lightRed,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
