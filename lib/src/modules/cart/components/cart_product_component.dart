import 'package:flutter/material.dart';
import 'package:soodboard/src/modules/cart/models/cart_product_model.dart';

class CartProductComponent extends StatelessWidget {
  const CartProductComponent({Key? key, required this.cartProductModel})
      : super(key: key);
  final CartProductModel cartProductModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color(0xFF9B9B9B),
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(cartProductModel.image),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartProductModel.productName,
                ),
              ],
            ),
          ),
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.favorite,
                  size: 24,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.delete,
                  size: 24,
                ),
              ),
            ],
          ),
          Row(
          children: [
          Expanded(
          child: Container(
    height: 4,
    color: Colors.grey[300],
    child: Row(
    children: [
    Expanded(
    child: Container(
    height: double.infinity,
    color: Colors.blue ,
      child: Icon(Icons.add),
    ),
    ),
    Expanded(
    child: Container(
    height: double.infinity,
    color: Colors.blue,
      child: Text('1'),
    ),
    ),
    Expanded(
    child: Container(
    height: double.infinity,
    color:  Colors.blue,
      child: Icon(Icons.remove),
    ),
    ),
    ],
    ),
    ),
    ),
    SizedBox(width: 8),
    Text('1'),
    ],)
        ],
      ),
    );
  }
}

