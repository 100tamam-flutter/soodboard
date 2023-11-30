import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soodboard/src/models/product_model.dart';
import 'package:vrouter/vrouter.dart';

class ProductTileHalfWidth extends StatelessWidget {
  const ProductTileHalfWidth({Key? key, required this.productModel, this.onRemove}) : super(key: key);
  final ProductModel productModel;
  final Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.vRouter.to('/product_detail'),
      child: Container(
        height: 300,
        width: (MediaQuery.sizeOf(context).width / 2) - 22.5,
        margin: const EdgeInsets.only(bottom: 13),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFFEBF0FF),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  productModel.image,
                  width: (MediaQuery.sizeOf(context).width / 2) - 54.5,
                  height: (MediaQuery.sizeOf(context).width / 2) - 54.5,
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
                RatingBar.builder(
                  initialRating: productModel.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.only(right: 2.0),
                  itemSize: 12,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
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
                            color: const Color(0xFFFB7181),
                          ),
                    ),
                    Expanded(child: Container()),
                    if (onRemove != null)
                      IconButton(
                        onPressed: onRemove,
                        icon: SvgPicture.asset(
                          'assets/icons/trash.svg',
                          height: 24,
                        ),
                      )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
