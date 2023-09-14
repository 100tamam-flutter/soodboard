import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/components/search_field.dart';
import 'package:soodboard/src/modules/home_screen/components/category_component.dart';
import 'package:soodboard/src/modules/home_screen/components/product_home_component.dart';
import 'package:soodboard/src/modules/home_screen/components/recomended_product_component.dart';
import 'package:soodboard/src/modules/home_screen/components/slidebar_component.dart';
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
                Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 16,
                          bottom: 32,
                          left: 16,
                          right: 16,
                        ),
                        child: SSearchField()
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          bottom: 16,
                          right: 8,
                          left: 16,
                        ),
                        child: InkWell(
                          child: SvgPicture.asset(
                            'assets/icons/love.svg',
                            height: 24,
                            width: 24,
                          ),
                          onTap: () {},
                        )),
                    const SizedBox(width: 10),
                    Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          bottom: 16,
                          left: 8,
                          right: 16,
                        ),
                        child: InkWell(
                          child: SvgPicture.asset(
                            'assets/icons/notification.svg',
                            height: 24,
                            width: 24,
                          ),
                          onTap: () {},
                        ))
                  ],
                ),
                const SizedBox(height: 20),
                SlideBarComponent(bannerModels: provider.banners),
                const SizedBox(
                  height: 48,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Text(
                        "Category",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: Text("More Category",
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: const Color(0xFF40BFFF),
                                  )),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                const CategoryComponent(),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Text(
                        "Flash Sale",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: Text("See More",
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: const Color(0xFF40BFFF),
                                  )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 238,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: provider.products
                        .map((e) => ProductHomeComponent(productModel: e))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Text(
                        "Mega Sale",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: Text("See More",
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: const Color(0xFF40BFFF),
                                  )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 238,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: provider.products
                        .map((e) => ProductHomeComponent(productModel: e))
                        .toList(),
                  ),
                ),
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
                SizedBox(
                  height: 238,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: provider.products
                        .map((e) => RecomendedProductComponent(productModel: e))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 238,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: provider.products
                        .map((e) => RecomendedProductComponent(productModel: e))
                        .toList(),
                  ),
                ),
              ],
            ),
    );
  }
}
