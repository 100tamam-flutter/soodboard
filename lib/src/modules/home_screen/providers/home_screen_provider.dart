import 'package:flutter/material.dart';
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
  }

  late List<BannerModel> banners;
  late List<ProductModel> products;


  final HomeScreenProductsAPI _homeScreenProductsAPI = HomeScreenProductsAPIMock();

  bool loadingBanners = true;
  bool loadingProducts = true;

  Future<void> initBanners() async {
    getBanners();
  }
  Future<void> initProducts() async {
    getProducts();
  }

  Future<void> getBanners() async {
    loadingBanners = true;
    notifyListeners();
    try {
      banners = await _homeScreenProductsAPI.getBanners();
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
      products = await _homeScreenProductsAPI.getProducts();
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingProducts = false;
    notifyListeners();
  }



}
