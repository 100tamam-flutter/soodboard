import 'package:flutter/material.dart';
import 'package:soodboard/src/models/product_model.dart';

class ProductHomeComponent extends StatelessWidget {
  const ProductHomeComponent ({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(productModel.image),
      Text(productModel.title),
          Text(
            productModel.price.toString(),
            style:  Theme.of(context).textTheme.labelLarge?.copyWith(
              color: const Color(0xFF40BFFF)
            )
          ),
          Row(
            children: [
              Text(
                productModel.previousPrice.toString(),
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                '${productModel.price * productModel.discount / 100}',
                style: const TextStyle(color: Colors.red),
              ),
            ],
          )
    ]
    );
  }
}

