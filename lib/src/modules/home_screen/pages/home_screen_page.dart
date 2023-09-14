import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/components/product/product_tile_half_width.dart';
import 'package:soodboard/src/components/search_field.dart';
import 'package:soodboard/src/components/product/product_tile_small.dart';
import 'package:soodboard/src/modules/home_screen/components/slidebar_component.dart';
import '../../explore/components/category_component.dart';
import '../../home_screen/providers/home_screen_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenProvider(context),
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeScreenProvider>();
    return Scaffold(
      body: provider.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    const Expanded(child: SSearchField()),
                    const SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      child: SvgPicture.asset(
                        'assets/icons/love.svg',
                        height: 24,
                        width: 24,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      child: SvgPicture.asset(
                        'assets/icons/notification.svg',
                        height: 24,
                        width: 24,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                SlideBarComponent(bannerModels: provider.banners),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        "Category",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Expanded(child: Container()),
                      Text(
                        "More Category",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: const Color(0xFF40BFFF),
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 12),
                    children: provider.categories
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: CategoryComponent(categoryModel: e),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        "Flash Sale",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Expanded(child: Container()),
                      Text(
                        "See More",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: const Color(0xFF40BFFF),
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 238,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 16),
                    children: provider.products
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: ProductTileSmall(productModel: e),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        "Mega Sale",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Expanded(child: Container()),
                      Text(
                        "See More",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: const Color(0xFF40BFFF),
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 238,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 16),
                    children: provider.products
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: ProductTileSmall(productModel: e),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 9),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        SizedBox(
                          height: 270,
                          width: MediaQuery.sizeOf(context).width,
                          child: Image.asset(
                            "assets/products/shoes2.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(32),
                          child: Text(
                              "Recomended                                                                            "
                              "Product",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontSize: 30,
                                  )),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(32),
                      child: Text("We recommend the best for you",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Wrap(
                    spacing: 13,
                    children: provider.products
                        .map(
                          (e) => ProductTileHalfWidth(productModel: e),
                    )
                        .toList(),
                  ),
                ),
              ],
            ),
    );
  }
}
