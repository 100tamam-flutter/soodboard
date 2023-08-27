import 'package:flutter/material.dart';
import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../utils/error_handler.dart';
import '../api/product_detail_api.dart';
import '../models/product_detail_model.dart';

class ProductDetailProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  ProductDetailProvider(this.context) {
    initProductDetail();
  }

  late ProductDetailModel productDetail;

  final ProductDetailAPI _productDetailAPI = ProductDetailApiImp();

  bool loadingProductDetail = true;

  Future<void> initProductDetail() async {
    getProductDetail();
  }

  Future<void> getProductDetail() async {
    loadingProductDetail = true;
    notifyListeners();
    try {
      productDetail = await _productDetailAPI.getProductDetail("1");
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingProductDetail = false;
    notifyListeners();
  }
}

