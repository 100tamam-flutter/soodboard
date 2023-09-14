import 'package:flutter/material.dart';
import 'package:soodboard/src/modules/cart/models/cart_product_model.dart';

class CartProductComponent extends StatelessWidget {
  const CartProductComponent({
    Key? key,
    required this.cartProductModel,
    required this.removeFromCart,
    required this.reduceQuantity,
    required this.increaseQuantity,
  }) : super(key: key);
  final CartProductModel cartProductModel;
  final Function() removeFromCart;
  final Function() reduceQuantity;
  final Function() increaseQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color(0xFFEBF0FF),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 72,
            height: 72,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(cartProductModel.image),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        cartProductModel.productName,
                        style: Theme.of(context).textTheme.labelLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.favorite,
                        size: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: removeFromCart,
                      child: const Icon(
                        Icons.delete,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${cartProductModel.price}',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: const Color(0xFF40BFFF),
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: reduceQuantity,
                          child: Container(
                            height: 24,
                            width: 32,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFEBF0FF),
                              ),
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(8),
                              ),
                            ),
                            child: const Icon(
                              Icons.remove,
                              size: 16,
                            ),
                          ),
                        ),
                        Container(
                          height: 24,
                          width: 40,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0xFFEBF0FF),
                          ),
                          child: Text(
                            '${cartProductModel.quantity}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: const Color(0xFF223263),
                                ),
                          ),
                        ),
                        InkWell(
                          onTap: increaseQuantity,
                          child: Container(
                            height: 24,
                            width: 32,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFEBF0FF),
                              ),
                              borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(8),
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 16,
                            ),
                          ),
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
