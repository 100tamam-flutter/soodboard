import 'package:flutter/material.dart';
import 'package:soodboard/src/models/product_model.dart';

import '../../../components/product/product_tile_half_width.dart';
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
  final MoreProductsApi _moreProductsApi = MoreProductsApiMock();

  bool loadingProducts = true;

  Future<void> initProducts() async {
    getProducts();
  }

  GlobalKey<AnimatedGridState>? gridKey;

  setGridKey(GlobalKey<AnimatedGridState> newKey) {
    gridKey = newKey;
  }

  List<int> processes = [];

  Future<void> getProducts() async {
    final previousItemsLength = products.length;
    final List<ProductModel> copyOfProducts = List.from(products);

    for (int i = previousItemsLength - 1; i >= 0; i--) {
      gridKey!.currentState!.removeItem(
        i,
        (context, animation) => ScaleTransition(
          scale: animation,
          child: Center(
            child: ProductTileHalfWidth(
              productModel: copyOfProducts[i],
            ),
          ),
        ),
      );

      // Remove item from the original list
      products.removeAt(i);
      notifyListeners();
    }
    loadingProducts = true;
    notifyListeners();
    try {
      processes.add(0);
      final newProducts = await _moreProductsApi.getProducts();
      processes.removeLast();
      if (processes.isEmpty) {
        // only the last process can modify the list
        loadingProducts = false;
        notifyListeners();
        for (int i = 0; i < newProducts.length; i++) {
          products.add(newProducts[i]);
          notifyListeners();
          gridKey!.currentState!.insertItem(i, duration: const Duration(milliseconds: 350));
          await Future.delayed(const Duration(milliseconds: 100));
        }
      }
    } on ApiError catch (e) {
      showError(context, e);
      loadingProducts = false;
      notifyListeners();
    }
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
