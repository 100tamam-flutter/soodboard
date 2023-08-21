import 'package:flutter/material.dart';
import 'package:soodboard/src/modules/cart/models/cart_product_model.dart';

class CartProductComponent extends StatelessWidget {
  const CartProductComponent({Key? key, required this.cartProductModel})
      : super(key: key);
  final CartProductModel cartProductModel;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        cartProductModel.productName,
                      ),
                    ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$299,43'),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 24,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFEBF0FF),
                              ),
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(8))),
                          child: Icon(Icons.remove),
                        ),
                        Container(
                          height: 24,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18,
                          ),
                          decoration: BoxDecoration(color: Color(0xFFEBF0FF)),
                          child: Text('1'),
                        ),
                        Container(
                          height: 24,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFEBF0FF),
                              ),
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(8))),
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
