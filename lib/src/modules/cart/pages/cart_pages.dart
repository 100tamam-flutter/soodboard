import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/modules/cart/components/cart_product_component.dart';
import 'package:soodboard/src/modules/cart/providers/cart_providers.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(context),
      child: const _CartPage(),
    );
  }
}

class _CartPage extends StatelessWidget {
  const _CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Cart',
          style: TextStyle(
            color: Color(0xFF223263),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: provider.products
                  .map((e) => CartProductComponent(cartProductModel: e))
                  .toList(),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          topLeft: Radius.circular(5),
                        ),
                        border: Border.all(
                          color: const Color(0xFF9B9B9B),
                          width: 0.5,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Enter Coupon Code',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Color(0xFF9B9B9B)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    width: 87,
                    height: 56,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Apply',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(16),
            width: 343,
            height: 164,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: const Color(0xFF9B9B9B),
                width: 0.5,
              ),
            ),
            child: Column(
              children: [
                const Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Items',
                            style: TextStyle(color: Color(0xFF9B9B9B))),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Shipping',
                            style: TextStyle(color: Color(0xFF9B9B9B))),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Import charges',
                            style: TextStyle(color: Color(0xFF9B9B9B))),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Total Price',
                          style: TextStyle(
                              color: Color(0xFF223263),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(provider.getTotalPrice().toString())
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(16),
                    width: 343,
                    height: 57,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text('Check Out',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
