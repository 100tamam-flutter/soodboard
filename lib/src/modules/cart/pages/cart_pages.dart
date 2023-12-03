import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/modules/cart/components/cart_product_component.dart';
import 'package:soodboard/src/modules/cart/providers/cart_providers.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CartProvider>();
    final staticProvider = context.read<CartProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Cart',
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          const Divider(
            color: Color(0xFFEBF0FF),
          ),
          Expanded(
            child: ListView(
              children: provider.products
                  .map(
                    (e) => CartProductComponent(
                      cartProductModel: e,
                      increaseQuantity: () => staticProvider.increaseQuantity(e.id),
                      reduceQuantity: () => staticProvider.reduceQuantity(e.id),
                      removeFromCart: () => staticProvider.removeFromCart(e.id),
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 56,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFEBF0FF)),
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(5),
                      ),
                    ),
                    child: TextField(
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xFF9098B1)),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Product",
                        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: const Color(0xFF9098B1),
                            ),
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  width: 87,
                  height: 56,
                  decoration: const BoxDecoration(
                    color: Color(0xFF40BFFF),
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Apply',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: const Color(0xFFEBF0FF),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Items',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color(0xFF9098B1),
                          ),
                    ),
                    Text('\$${provider.getTotalItemsPrice()}', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color(0xFF9098B1),
                          ),
                    ),
                    Text('\$40.0', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Import Charges',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color(0xFF9098B1),
                          ),
                    ),
                    Text('\$128.0', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      '\$${provider.getTotalPrice()}',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: const Color(0xFF40BFFF),
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 57,
            decoration: BoxDecoration(
              color: const Color(0xFF40BFFF),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                'Check Out',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
