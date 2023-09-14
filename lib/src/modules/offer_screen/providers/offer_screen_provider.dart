import 'package:flutter/material.dart';
import 'package:soodboard/src/modules/home_screen/api/home_screen_api.dart';
import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../models/product_model.dart';
import '../../../utils/error_handler.dart';

class OfferScreenProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  OfferScreenProvider (this.context) {
    initProducts();
  }

  late List<ProductModel> products;

  final HomeScreenProductsAPI _homeScreenProductsApi = HomeScreenProductsAPIMock();

  bool loadingProducts = true;

  get loading => loadingProducts;

  Future<void> initProducts() async {
    getProducts();
  }
  Future<void> getProducts() async {
    loadingProducts = true;
    notifyListeners();
    try {
      products = await _homeScreenProductsApi.getRecommendedProducts();
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingProducts = false;
    notifyListeners();
  }

}
