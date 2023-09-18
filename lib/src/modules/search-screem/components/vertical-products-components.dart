import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:soodboard/src/models/product_model.dart';
import 'package:vrouter/vrouter.dart';

import '../../../components/product/product_tile_half_width.dart';

class VerticalProducts extends StatelessWidget {
  const VerticalProducts ({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {

    return Wrap(
          spacing: 13,
          children: products
              .map(
                (e) => ProductTileHalfWidth(productModel: e),
          )
              .toList(),
        );
  }
}