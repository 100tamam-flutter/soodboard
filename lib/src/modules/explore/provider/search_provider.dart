import 'package:flutter/material.dart';
import 'package:soodboard/src/models/product_model.dart';
import 'package:soodboard/src/modules/explore/api/explore_api.dart';
import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../utils/error_handler.dart';


class SearchProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  SearchProvider(this.context) {
    initProducts();
  }

  late List<ProductModel> products = [];
  final ExploreAPI _exploreApi = ExploreAPIMock();

  bool loadingProducts = true;

  Future<void> initProducts() async {
    getProducts();
  }

  Future<void> getProducts() async {
    loadingProducts = true;
    notifyListeners();
    try {
      products = await _exploreApi.searchProducts('');
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingProducts = false;
    notifyListeners();
  }


  Future<void> searchProducts(String searchText) async {
    loadingProducts = true;
    notifyListeners();
    try {
      products = await _exploreApi.searchProducts(searchText);
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingProducts = false;
    notifyListeners();
  }
}
