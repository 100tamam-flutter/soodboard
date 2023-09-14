import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/components/product/products_horizontal_listview.dart';
import 'package:soodboard/src/modules/product-details/components/panels/product_images_panel.dart';
import 'package:soodboard/src/modules/product-details/components/panels/product_main_info_panel.dart';
import 'package:soodboard/src/modules/product-details/components/panels/review_panel.dart';
import 'package:soodboard/src/modules/product-details/components/panels/select_color_panel.dart';
import 'package:soodboard/src/modules/product-details/components/panels/select_size_panel.dart';
import '../../products-review/products-review-page.dart';
import '../components/panels/specifications_panel.dart';
import '../providers/product_detail_provider.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductDetailProvider(context),
      child: const _ProductDetails(),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductDetailProvider>();
    final staticProvider = context.read<ProductDetailProvider>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/Left.svg"),
        ),
        title: Text(
          provider.loadingProductDetail
              ? 'Loading Data'
              : provider.productDetail.title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/Search_2.svg"),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/More.svg"),
          ),
        ],
      ),
      body: provider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ProductImagesPanel(
                        firstImage: provider.productDetail.firstImage,
                        secondImage: provider.productDetail.secondImage,
                        thirdImage: provider.productDetail.thirdImage,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ProductMainInfoPanel(
                        productDetail: provider.productDetail,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SelectSizePanel(
                        sizes: provider.productDetail.sizes,
                        selectSize: staticProvider.selectSize,
                        selectedSizeIndex: provider.selectedSize,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SelectColorPanel(
                        selectColor: staticProvider.selectColor,
                        colors: provider.productDetail.colors,
                        selectedColorIndex: provider.selectedColor,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SpecificationsPanel(
                        style: provider.productDetail.style,
                        shown: provider.productDetail.shown,
                        description: provider.productDetail.description,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      if (provider.reviews.isNotEmpty)
                        ReviewPanel(
                          productRating: provider.productDetail.rating,
                          reviewsNumber: provider.reviews.length,
                          firstReview: provider.reviews.first,
                        ),
                      const SizedBox(
                        height: 25,
                      ),
                      ProductsHorizontalListView(
                        products: provider.relatedProducts,
                        title: "You Might Also Like",
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductsReview()));
                  },
                  child: Container(
                    height: 57,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Add to cart",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
