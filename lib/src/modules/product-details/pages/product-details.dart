import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:soodboard/src/modules/product-details/components/circleColor_component.dart';
import 'package:soodboard/src/modules/product-details/components/circleSize.dart';
import 'package:soodboard/src/modules/product-details/components/recProduct_box_component.dart';
import '../providers/product_detail_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/Left.svg"),
        ),
        title: Text(
          "Nike Air Max",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/Search.svg"),
          ),
          IconButton(
            onPressed: () {},
            icon:SvgPicture.asset("assets/icons/More.svg"),
          ),
        ],
      ),
      body: provider.loadingProductDetail
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                SizedBox(
                  height: 238,
                  child: ImageSlideshow(
                    indicatorColor: Colors.blue,
                    onPageChanged: (value) {
                      debugPrint('Page changed: $value');
                    },
                    autoPlayInterval: 3000,
                    isLoop: true,
                    children: [
                      Image.asset(
                        'assets/mock-files/image1.png',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/mock-files/image2.png',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/mock-files/image3.png',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      provider.productDetailModel.title,
                      style: Theme.of(context).textTheme.titleLarge,

                    ),
                    IconButton(onPressed: (){},
                        icon:SvgPicture.asset('assets/icons/Add Favorite Icon.svg'),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 96,
                      height:16,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/icons/star_rating (1).svg'),
                      ),
                    ),
                  ],
                ),
                Text(
                  "&299.43",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "Select Size",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height:48,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    children: const [
                      CircleSize(name: "6"),
                      CircleSize(name: "6.5"),
                      CircleSize(name: "7"),
                      CircleSize(name: "7.5"),
                      CircleSize(name: "8"),
                      CircleSize(name: "8.5"),
                      CircleSize(name: "9"),
                    ],
                  ),
                ),
                Text(
                  "Select Color",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height:48,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    children: const [
                      Gap(16),
                      CircleColor(customColor: Colors.yellow),
                      Gap(15),
                      CircleColor(customColor: Colors.red),
                      CircleColor(customColor: Colors.greenAccent),
                      CircleColor(customColor: Colors.pink),
                      CircleColor(customColor: Colors.lightBlueAccent),
                      CircleColor(customColor: Colors.deepPurple),
                      CircleColor(customColor: Colors.white),
                      CircleColor(customColor: Colors.black),
                    ],
                  ),
                ),
                Text(
                  "You Might Also Like",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: 238,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    children: [
                      RecProduct_box(
                        name: "FS - Nike Air Max 270 React..",
                        price: " /299.43",
                        offer: " not 534,33",
                        percentage: '24% off',
                      ),
                      RecProduct_box(
                        name: "FS - QUILTED MAXI CROS...",
                        price: " /299,43",
                        offer: " not 534,33",
                        percentage: '24% off',
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "add to cart",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
