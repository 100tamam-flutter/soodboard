import 'package:flutter/material.dart';
import 'package:soodboard/src/models/banner_model.dart';
import 'package:soodboard/src/modules/explore/api/explore_api.dart';
import 'package:soodboard/src/modules/explore/models/category_model.dart';
import 'package:soodboard/src/modules/home/api/home_screen_api.dart';

import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../models/product_model.dart';
import '../../../utils/error_handler.dart';

class HomeScreenProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  HomeScreenProvider(this.context) {
    initBanners();
    initProducts();
    initCategories();
  }

  late List<BannerModel> banners;
  late List<ProductModel> flashSaleProducts;
  late List<ProductModel> megaSaleProducts;
  late List<ProductModel> recommendedProducts;
  late List<CategoryModel> categories;
  final HomeScreenProductsAPI _homeScreenProductsApi = HomeScreenProductsAPIMock();
  final ExploreAPI _exploreAPI = ExploreAPIMock();

  bool loadingBanners = true;
  bool loadingFlashSale = true;
  bool loadingMegaSale = true;
  bool loadingRecommended = true;
  bool loadingCategories = true;

  get loading => loadingBanners || loadingFlashSale || loadingCategories || loadingMegaSale || loadingRecommended;

  Future<void> initBanners() async {
    getBanners();
  }

  Future<void> initProducts() async {
    getFlashSale();
    getMegaSale();
    getRecommended();
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

  Future<void> getFlashSale() async {
    loadingFlashSale = true;
    notifyListeners();
    try {
      flashSaleProducts = await _homeScreenProductsApi.getFlashSale();
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingFlashSale = false;
    notifyListeners();
  }

  Future<void> getMegaSale() async {
    loadingMegaSale = true;
    notifyListeners();
    try {
      megaSaleProducts = await _homeScreenProductsApi.getMegaSale();
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingMegaSale = false;
    notifyListeners();
  }

  Future<void> getRecommended() async {
    loadingRecommended = true;
    notifyListeners();
    try {
      recommendedProducts = await _homeScreenProductsApi.getRecommendedProducts();
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingRecommended = false;
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
