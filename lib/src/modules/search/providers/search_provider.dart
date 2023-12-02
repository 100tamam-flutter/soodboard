import 'package:flutter/material.dart';
import 'package:soodboard/src/models/product_model.dart';
import 'package:soodboard/src/modules/search/api/search_api.dart';

import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../utils/error_handler.dart';

class SearchProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  SearchProvider(this.context) {
    initProducts();
  }

  List<ProductModel> products = [];
  final SearchApi _favoriteProductsApi = SearchApiMock();

  bool loadingProducts = true;

  String searchText = '';

  void changeSearchText(String newSearchText) {
    searchText = newSearchText;
    getProducts();
  }

  Future<void> initProducts() async {
    getProducts();
  }

  Future<void> getProducts() async {
    loadingProducts = true;
    notifyListeners();
    try {
      products = await _favoriteProductsApi.searchProducts(searchText: searchText);
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingProducts = false;
    notifyListeners();
  }
}
