import 'package:flutter/material.dart';
import 'package:soodboard/src/models/product_model.dart';

import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../utils/error_handler.dart';
import '../api/more_products_api.dart';

class MoreProductsProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  final String sort;

  MoreProductsProvider({required this.context, required this.sort}) {
    initProducts();
  }

  List<ProductModel> products = [];
  final MoreProductsApi _favoriteProductsApi = MoreProductsApiMock();

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

  removeItem(int index) {
    _showRemoveDialog(index);
  }

  Future<void> _showRemoveDialog(int index) async {
    final bool remove = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Are you sure to remove this item from your favorite?'),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Yes'),
          ),
        ],
        contentPadding: const EdgeInsets.all(16),
      ),
    );
    if (remove) {
      products.removeAt(index);
      notifyListeners();
    }
  }
}
