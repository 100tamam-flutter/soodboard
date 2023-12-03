import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/models/product_model.dart';
import 'package:soodboard/src/modules/cart/providers/cart_providers.dart';
import 'package:soodboard/src/modules/product-details/api/review_api.dart';
import 'package:vrouter/vrouter.dart';

import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../utils/error_handler.dart';
import '../api/product_detail_api.dart';
import '../models/product_detail_model.dart';
import '../models/review_model.dart';

class ProductDetailProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  ProductDetailProvider({required this.context, required this.productId}) {
    initProductDetail();
  }

  final String productId;

  late final ProductDetailModel productDetail;
  late final List<ReviewModel> reviews;
  late final List<ProductModel> relatedProducts;
  final ProductDetailAPI _productDetailAPI = ProductDetailAPIMock();
  final ReviewApi _reviewApi = ReviewApiMock();

  bool loadingProductDetail = true;
  bool loadingReviews = true;
  bool loadingRelatedProducts = true;

  get isLoading => loadingProductDetail || loadingReviews || loadingRelatedProducts;

  Future<void> initProductDetail() async {
    getProductDetail();
    getReviews();
    getRelatedProducts();
  }

  Future<void> getProductDetail() async {
    loadingProductDetail = true;
    notifyListeners();
    try {
      productDetail = await _productDetailAPI.getProductDetail(productId);
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingProductDetail = false;
    notifyListeners();
  }

  Future<void> getReviews() async {
    loadingReviews = true;
    notifyListeners();
    try {
      reviews = await _reviewApi.getReviews();
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingReviews = false;
    notifyListeners();
  }

  Future<void> getRelatedProducts() async {
    loadingRelatedProducts = true;
    notifyListeners();
    try {
      relatedProducts = await _productDetailAPI.getRelatedProducts(productId);
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingRelatedProducts = false;
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

  void addToCart() async {
    final cartProvider = context.read<CartProvider>();
    cartProvider.addToCart(productDetail);
    context.vRouter.to('/cart');
  }
}
