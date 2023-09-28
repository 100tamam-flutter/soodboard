import 'package:flutter/material.dart';
import '../../../components/product/product_tile_half_width.dart';
import '../../../models/product_model.dart';

class RecommendedProductsPanel extends StatelessWidget {
  const RecommendedProductsPanel({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        SizedBox(
                          height: 270,
                          width: MediaQuery.sizeOf(context).width,
                          child: Image.asset(
                            "assets/products/shoes2.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(32),
                          child: Text(
                              "Recomended                                                                            "
                                  "Product",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                color: Colors.white,
                                fontSize: 30,
                              )),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(32),
                      child: Text("We recommend the best for you",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w400)),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Wrap(
                    spacing: 13,
                    children: products
                        .map(
                          (e) => ProductTileHalfWidth(productModel: e),
                    )
                        .toList(),
                  ),
                ),
              ],
            );

  }
}
