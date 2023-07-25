import 'package:flutter/material.dart';
import 'package:soodboard/src/modules/home_screen/api/home_screen_api.dart';
import 'package:soodboard/src/models/banner_model.dart';
import '../../home_screen/components/slidebar_component.dart';
import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../utils/error_handler.dart';

class HomeScreenProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  HomeScreenProvider (this.context) {
    initbanners();
  }

  late List<BannerModel> banners;
  final HomeScreenProductsAPI _homeScreenProductsAPI = HomeScreenProductsAPIMock();

  bool loadingbanners = true;

  Future<void> initbanners() async {
    print("initing");
    getbanners();
  }

  Future<void> getbanners() async {
    print("getting banners");
    loadingbanners = true;
    notifyListeners();
    try {
      banners = await _homeScreenProductsAPI.getBanners();
      print(banners);
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingbanners = false;
    notifyListeners();
  }
}
