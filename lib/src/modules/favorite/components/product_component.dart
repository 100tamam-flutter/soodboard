import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({Key? key, required this.productModel})
      : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(productModel.image),
      title: Text(productModel.title),
      subtitle: Row(
        children: [
          Text(
            '${productModel.price}',
            style: const TextStyle(color: Colors.green),
          ),
          const SizedBox(
            width: 16,
          ),

        ],
      ),
    );
  }
}
