import 'package:flutter/material.dart';
import 'package:soodboard/src/models/product_model.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({Key? key, required this.productModel})
      : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(productModel.image),
      title: Text(productModel.title),
      subtitle: Row(
        children: [
          Text(
            productModel.price.toString(),
            style: const TextStyle(
                decoration: TextDecoration.lineThrough, color: Colors.red),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            '${productModel.price * productModel.discount / 100}',
            style: const TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
