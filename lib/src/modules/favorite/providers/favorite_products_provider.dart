import 'package:flutter/material.dart';
import 'package:soodboard/src/models/product_model.dart';
import 'package:soodboard/src/modules/favorite/api/favorite_products_api.dart';

import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../utils/error_handler.dart';

class FavoriteProductsProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  FavoriteProductsProvider(this.context) {
    initProducts();
  }

  List<ProductModel> products = [];
  final FavoriteProductsAPI _favoriteProductsApi = FavoriteProductsAPIMock();

  bool loadingProducts = true;

  Future<void> initProducts() async {
    getProducts();
  }

  Future<void> getProducts() async {
    loadingProducts = true;
    notifyListeners();
    try {
      products = await _favoriteProductsApi.getProducts();
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingProducts = false;
    notifyListeners();
  }
}
