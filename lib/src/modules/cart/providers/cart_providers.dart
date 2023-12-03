import 'package:soodboard/src/modules/cart/models/cart_product_model.dart';
import 'package:soodboard/src/modules/product-details/models/product_detail_model.dart';

import '../../../core/providers/safe_provider.dart';
import '../../../utils/error_handler.dart';

class CartProvider extends SafeProvider with ErrorHandler {
  CartProvider();

  double getTotalItemsPrice() {
    double totalPrice = 0;
    if (products.isNotEmpty) {
      for (var element in products) {
        totalPrice += element.price * element.quantity;
      }
    }
    return totalPrice;
  }

  double getTotalPrice() {
    double totalPrice = 0;
    if (products.isNotEmpty) {
      for (var element in products) {
        totalPrice += element.price * element.quantity;
      }
      totalPrice += 40.0 + 128.0;
    }
    return totalPrice;
  }

  List<CartProductModel> products = [];

  bool loadingProducts = true;

  void addToCart(ProductDetailModel productDetail) {
    if (products.any((element) => element.id == productDetail.id)) {
      products.singleWhere((element) => element.id == productDetail.id).quantity++;
    } else {
      products.add(
        CartProductModel(
          id: productDetail.id,
          image: productDetail.images[0],
          productName: productDetail.title,
          quantity: 1,
          price: productDetail.price,
        ),
      );
    }
    notifyListeners();
  }

  void removeFromCart(String id) {
    products.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void reduceQuantity(String id) {
    if (products.singleWhere((element) => element.id == id).quantity > 1) {
      products.singleWhere((element) => element.id == id).quantity--;
    } else {
      products.removeWhere((element) => element.id == id);
    }
    notifyListeners();
  }

  void increaseQuantity(String id) {
    products.singleWhere((element) => element.id == id).quantity++;
    notifyListeners();
  }
}
