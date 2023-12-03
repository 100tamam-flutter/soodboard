import 'dart:async';

import 'package:flutter/material.dart';
import 'package:soodboard/src/core/localization.dart';
import 'package:soodboard/src/models/product_model.dart';
import 'package:soodboard/src/modules/explore/api/explore_api.dart';
import 'package:soodboard/src/modules/search/api/search_api.dart';

import '../../../components/product/product_tile_half_width.dart';
import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../utils/error_handler.dart';
import '../../explore/models/category_model.dart';

class SearchProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  SearchProvider({required this.context, this.categoryId}) {
    initProducts();
  }

  List<ProductModel> products = [];
  final SearchApi _favoriteProductsApi = SearchApiMock();
  final ExploreAPI _exploreAPI = ExploreAPIMock();

  bool loadingProducts = false;
  bool loadingCategories = false;
  late List<CategoryModel> categories = [];

  String searchText = '';

  final String? categoryId;

  GlobalKey<AnimatedGridState>? gridKey;

  setGridKey(GlobalKey<AnimatedGridState> newKey) {
    gridKey = newKey;
  }

  void changeSearchText(String newSearchText) {
    // Cancel the previous timer (if any)
    _debounceTimer?.cancel();
    // Start a new timer
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      // This function will be called after a 1-second delay
      searchText = newSearchText;
      getProducts();
    });
  }

  Timer? _debounceTimer;
  List<int> processes = [];

  Future<void> initProducts() async {
    getProducts();
    getCategories();
  }

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
      final newProducts = await _favoriteProductsApi.searchProducts(searchText: searchText);
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

  Future<void> getCategories() async {
    loadingCategories = true;
    notifyListeners();
    try {
      categories = await _exploreAPI.getCategories();
      if (categoryId != null) {
        selectCategory(categories.singleWhere((element) => element.slug == categoryId));
      }
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingCategories = false;
    notifyListeners();
  }

  ProductsSort? selectedSort;
  CategoryModel? selectedCategory;

  void selectSort(ProductsSort newSort) {
    if (selectedSort == newSort) {
      selectedSort = null;
      notifyListeners();
      getProducts();
    } else {
      selectedSort = newSort;
      notifyListeners();
      getProducts();
    }
  }

  void selectCategory(CategoryModel newCategory) {
    if (selectedCategory == newCategory) {
      selectedCategory = null;
      notifyListeners();
      getProducts();
    } else {
      selectedCategory = newCategory;
      notifyListeners();
      getProducts();
    }
  }

  void openSorts() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: sorts
              .map(
                (e) => InkWell(
                  onTap: () {
                    selectSort(e);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: (selectedSort == e) ? Theme.of(context).colorScheme.surface : Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(sortMapText()[e] ?? context.localizations.searchPageProductsSortRelevance),
                        if (selectedSort == e)
                          const Icon(
                            Icons.check_rounded,
                          ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  void openCategories() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: loadingCategories
            ? const CircularProgressIndicator()
            : ListView(
                // mainAxisSize: MainAxisSize.min,
                children: categories
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          selectCategory(e);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: (selectedCategory == e) ? Theme.of(context).colorScheme.surface : Colors.transparent,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(e.title),
                              if (selectedCategory == e)
                                const Icon(
                                  Icons.check_rounded,
                                ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
      ),
    );
  }

  List<ProductsSort> sorts = [
    ProductsSort.relevance,
    ProductsSort.newest,
    ProductsSort.popularity,
    ProductsSort.priceHighToLow,
    ProductsSort.priceLowToHigh,
  ];

  Map<ProductsSort?, String> sortMapText() {
    return {
      ProductsSort.relevance: context.localizations.searchPageProductsSortRelevance,
      ProductsSort.popularity: context.localizations.searchPageProductsSortPopularity,
      ProductsSort.newest: context.localizations.searchPageProductsSortNewest,
      ProductsSort.priceLowToHigh: context.localizations.searchPageProductsSortPriceLowToHigh,
      ProductsSort.priceHighToLow: context.localizations.searchPageProductsSortPriceHighToLow,
    };
  }
}

enum ProductsSort {
  relevance,
  popularity,
  newest,
  priceLowToHigh,
  priceHighToLow,
}
