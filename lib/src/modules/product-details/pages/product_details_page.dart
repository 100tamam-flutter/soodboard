import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/modules/product-details/components/panels/product_images_panel.dart';
import 'package:soodboard/src/modules/product-details/components/panels/product_main_info_panel.dart';
import 'package:soodboard/src/modules/product-details/components/panels/select_color_panel.dart';
import 'package:soodboard/src/modules/product-details/components/panels/select_size_panel.dart';
import 'package:soodboard/src/modules/product-details/components/recProduct_box_component.dart';
import '../../products-review/products-review-page.dart';
import '../components/panels/specifications_panel.dart';
import '../providers/product_detail_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
      body: provider.loadingProductDetail
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Review Product",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProductsReview()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white, // Background color
                            ),
                            child: Text(
                              "see more",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: const Color(0xFF40BFFF),
                                      fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      RatingBar.builder(
                        initialRating: provider.productDetail.rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        ignoreGestures: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.only(right: 2.0),
                        itemSize: 16,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 48,
                                width: 48,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/mock-files/Jamesp.png'),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "James Lawson",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  RatingBar.builder(
                                    initialRating:
                                        provider.productDetail.rating,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    ignoreGestures: true,
                                    itemCount: 5,
                                    itemPadding:
                                        const EdgeInsets.only(right: 2.0),
                                    itemSize: 16,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 72,
                                  width: 72,
                                  child: Image.asset(
                                      'assets/mock-files/product1.png')),
                              const SizedBox(
                                width: 16,
                              ),
                              SizedBox(
                                  height: 72,
                                  width: 72,
                                  child: Image.asset(
                                      'assets/mock-files/product1-2.png')),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "December 10, 2016",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "You Might Also Like",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(
                        height: 274,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(8),
                          children: const [
                            RecProductComponent(
                                image: "assets/mock-files/product1.png",
                                name: "First Product",
                                price: "\$534.33",
                                offer: '24% off',
                                before: "\$645.5"),
                            RecProductComponent(
                                image: "assets/mock-files/product2.png",
                                name: "Second Product",
                                price: "\$422.33",
                                offer: '24% off',
                                before: "\$645.5"),
                            RecProductComponent(
                                image: "assets/mock-files/product3.png",
                                name: "third Product",
                                price: "\$410.33",
                                offer: '24% off',
                                before: "\$645.5")
                          ],
                        ),
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
