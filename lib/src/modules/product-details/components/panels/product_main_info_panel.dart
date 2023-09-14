import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soodboard/src/modules/product-details/models/product_detail_model.dart';

class ProductMainInfoPanel extends StatelessWidget {
  const ProductMainInfoPanel({super.key, required this.productDetail});

  final ProductDetailModel productDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  productDetail.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/Add Favorite Icon.svg',
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          RatingBar.builder(
            initialRating: productDetail.rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            ignoreGestures: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.only(right: 2.0),
            itemSize: 16,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {},
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "\$${productDetail.price}",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: const Color(0xFF40BFFF), fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
