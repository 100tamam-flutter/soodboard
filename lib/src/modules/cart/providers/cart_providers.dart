import 'package:flutter/material.dart';
import 'package:soodboard/src/modules/cart/models/cart_product_model.dart';
import '../../../core/providers/safe_provider.dart';
import '../../../utils/error_handler.dart';

class CartProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  CartProvider(this.context) {
    products = [
      const CartProductModel(
          image: 'assets/images/shoe.png',
          productName: 'Nike Air Zoom Pegasus 36 Miami',
          quantity: 1,
          price: 29943),
      const CartProductModel(
          image: 'assets/images/redshoe.png',
          productName: 'Nike Air Zoom Pegasus 36 Miami',
          quantity: 1,
          price: 29943, )
    ];
    notifyListeners();
  }

  int getTotalPrice() {
    int totalPrice = 0;
    for (var element in products) {
      totalPrice += element.price;
    }
    return totalPrice;
  }

  List<CartProductModel> products = [];

  bool loadingProducts = true;
}