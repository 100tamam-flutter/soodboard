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
  late final ProductDetailModel productDetail;
  final ProductDetailAPI _productDetailAPI = ProductDetailAPIMock();




  bool loadingProductDetail = true;

  Future<void> initProductDetail() async {
    getProductDetail();
  }

  Future<void> getProductDetail() async {
    loadingProductDetail = true;
    notifyListeners();
    try {
      productDetail = await _productDetailAPI.getProductDetail();
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingProductDetail = false;
    notifyListeners();
  }

  int? selectedSize;

  selectSize(int sizeIndex) {
    selectedSize = sizeIndex;
    notifyListeners();
  }

  int? selectedColor;

  selectColor(int colorIndex) {
    selectedColor = colorIndex;
    notifyListeners();
  }
}

