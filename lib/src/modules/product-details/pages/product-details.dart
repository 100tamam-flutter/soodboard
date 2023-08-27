import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/modules/product-details/components/circleColor_component.dart';
import 'package:soodboard/src/modules/product-details/components/circleSize.dart';
import 'package:soodboard/src/modules/product-details/components/recProduct_box_component.dart';
import '../providers/product_detail_provider.dart';

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

  get itemBuilder => null;

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
            icon: SvgPicture.asset("assets/icons/search.svg"),
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
          : Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
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
                              Image.network(
                                provider.productDetail.image,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                provider.productDetail.title,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleLarge,
                                overflow: TextOverflow.ellipsis,

                              ),
                            ),
                            IconButton(onPressed: () {},
                              icon: SvgPicture.asset(
                                  'assets/icons/Add Favorite Icon.svg'),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 16,
                              child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/star_rating.svg',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\$${provider.productDetail.price}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: const Color(0xFF40BFFF),
                                  fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        Text(
                          "Select Size",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 48,
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 48,
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
                              CircleColor(customColor: Colors.blueGrey),
                              CircleColor(customColor: Colors.purple),
                              CircleColor(customColor: Colors.brown),
                              CircleColor(customColor: Colors.deepOrange),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Specification",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text(
                              "Shown:",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            Column(
                              children: [

                                Text(
                                  "Laser",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.w400,
                                    color:Colors.grey,),
                                ),
                                Text(
                                  " Blue/Anthracite/Watermelon/White",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.w400,
                                    color:Colors.grey,),
                                ),
                              ],
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Style",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.w400),
                                ),

                                Text(
                                  " CD0113-400",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.w400,
                                    color:Colors.grey,),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              " The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w400,
                                color:Colors.grey,),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
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
                            Text(
                              "see more",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                  color: const Color(0xFF40BFFF),
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: SizedBox(
                                width: 96,
                                height: 16,
                                child: SvgPicture.asset(
                                  'assets/icons/star_rating.svg',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.pinkAccent,
                                  radius:30,
                                ),
                                SizedBox(
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
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              provider.productDetail.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w400,
                                color:Colors.grey,),
                            ),
                          ],
                        ),
                        SizedBox(
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

                        SizedBox(
                          height: 60,
                        ),
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
                          "Add to cart",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
