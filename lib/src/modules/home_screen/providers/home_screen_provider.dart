import 'package:flutter/material.dart';
import 'package:soodboard/src/modules/explore/api/explore_api.dart';
import 'package:soodboard/src/modules/explore/models/category_model.dart';
import 'package:soodboard/src/modules/home_screen/api/home_screen_api.dart';
import 'package:soodboard/src/models/banner_model.dart';
import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../models/product_model.dart';
import '../../../utils/error_handler.dart';

class HomeScreenProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  HomeScreenProvider (this.context) {
    initBanners();
    initProducts();
    initCategories();
  }

  late List<BannerModel> banners;
  late List<ProductModel> products;
  late List<CategoryModel> categories;
  final HomeScreenProductsAPI _homeScreenProductsApi = HomeScreenProductsAPIMock();
  final ExploreAPI _exploreAPI = ExploreAPIMock();

  bool loadingBanners = true;
  bool loadingProducts = true;
  bool loadingCategories = true;
  get loading => loadingBanners || loadingProducts || loadingCategories;

  Future<void> initBanners() async {
    getBanners();
  }
  Future<void> initProducts() async {
    getProducts();
  }
  Future<void> initCategories() async {
    getCategories();
  }

  Future<void> getBanners() async {
    loadingBanners = true;
    notifyListeners();
    try {
      banners = await _homeScreenProductsApi.getBanners();
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingBanners = false;
    notifyListeners();
  }
  Future<void> getProducts() async {
    loadingProducts = true;
    notifyListeners();
    try {
      products = await _homeScreenProductsApi.getProducts();
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



}
