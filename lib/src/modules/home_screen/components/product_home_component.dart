import 'package:flutter/material.dart';
import 'package:soodboard/src/models/product_model.dart';

class ProductHomeComponent extends StatelessWidget {
  const ProductHomeComponent ({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 141,
      child: InkWell(
        onTap: () {},
        child: Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFFEBF0FF),
                )
            ),
          child: Column(
              children: [
                Image.asset(productModel.image),
                SizedBox(height: 5,),
                Text(productModel.title),
                Row(
                  children: [Text(
                    productModel.price.toString(),
                    style:  Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: const Color(0xFF40BFFF),
                    ),
                  ),],
                ),
                Row(
                  children: [
                    Text(
                      productModel.previousPrice.toString(),
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(width: 5,),
                    Text(
                      '${productModel.discount}%',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                )
              ]
          ),
        )
      ),
    );
  }
}

