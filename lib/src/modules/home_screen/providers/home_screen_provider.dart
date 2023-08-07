import 'package:flutter/material.dart';
import 'package:soodboard/src/modules/home_screen/api/home_screen_api.dart';
import 'package:soodboard/src/models/banner_model.dart';
import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../utils/error_handler.dart';

class HomeScreenProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  HomeScreenProvider (this.context) {
    initBanners();
  }

  late List<BannerModel> banners;
  final HomeScreenProductsAPI _homeScreenProductsAPI = HomeScreenProductsAPIMock();

  bool loadingBanners = true;

  Future<void> initBanners() async {
    getBanners();
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


}
