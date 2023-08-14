import 'package:flutter/material.dart';
import 'package:soodboard/src/modules/explore/models/category_model.dart';
import 'package:soodboard/src/modules/explore/api/explore_api.dart';
import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../utils/error_handler.dart';


class ExploreProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  ExploreProvider(this.context) {
    initcategories();
  }

 late List<CategoryModel> categories = [];
  final ExploreAPI _exploreApi = ExploreAPIMock();

  bool loadingcategories = true;

  Future<void> initcategories() async {
    getcategories();
  }

  Future<void> getcategories() async {
    loadingcategories = true;
    notifyListeners();
    try {
     categories = await _exploreApi.getcategories();
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingcategories = false;
    notifyListeners();
  }
}
