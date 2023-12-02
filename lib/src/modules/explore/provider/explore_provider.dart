import 'package:flutter/material.dart';
import 'package:soodboard/src/modules/explore/api/explore_api.dart';
import 'package:soodboard/src/modules/explore/models/category_model.dart';
import 'package:vrouter/vrouter.dart';

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

  bool loadingCategories = true;

  Future<void> initcategories() async {
    getcategories();
  }

  Future<void> getcategories() async {
    loadingCategories = true;
    notifyListeners();
    try {
      categories = await _exploreApi.getCategories();
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingCategories = false;
    notifyListeners();
  }

  searchProducts(String searchText) {
    context.vRouter.to('search', historyState: {'search_text': searchText});
  }
}
