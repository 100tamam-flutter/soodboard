import 'package:flutter/material.dart';
import 'package:soodboard/src/core/localization.dart';
import 'package:soodboard/src/models/product_model.dart';
import 'package:soodboard/src/modules/explore/api/explore_api.dart';
import 'package:soodboard/src/modules/search/api/search_api.dart';

import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../utils/error_handler.dart';
import '../../explore/models/category_model.dart';

class SearchProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  SearchProvider(this.context) {
    initProducts();
  }

  List<ProductModel> products = [];
  final SearchApi _favoriteProductsApi = SearchApiMock();
  final ExploreAPI _exploreAPI = ExploreAPIMock();

  bool loadingProducts = true;
  bool loadingCategories = false;
  late List<CategoryModel> categories = [];

  String searchText = '';

  void changeSearchText(String newSearchText) {
    searchText = newSearchText;
    getProducts();
  }

  Future<void> initProducts() async {
    getProducts();
    getCategories();
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

  Future<void> getCategories() async {
    loadingCategories = true;
    notifyListeners();
    try {
      categories = await _exploreAPI.getCategories();
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
