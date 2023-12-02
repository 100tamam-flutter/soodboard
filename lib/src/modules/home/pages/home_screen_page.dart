import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/components/product/products_horizontal_listview.dart';
import 'package:soodboard/src/modules/home/components/categories_panel.dart';
import 'package:soodboard/src/modules/home/components/home_banner_slidebar_component.dart';
import 'package:soodboard/src/modules/home/components/home_search_bar.dart';
import 'package:soodboard/src/modules/home/components/recommended_products_panel.dart';

import '../../home/providers/home_screen_provider.dart';

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
    return SafeArea(
      child: Scaffold(
        body: provider.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                key: UniqueKey(),
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const SliverAppBar(
                    flexibleSpace: HomeSearchBar(),
                    floating: true,
                    pinned: false,
                    collapsedHeight: 90,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        const SizedBox(height: 16),
                        HomeBannerSlideBarComponent(bannerModels: provider.banners),
                        const SizedBox(height: 24),
                        CategoriesPanel(categories: provider.categories),
                        const SizedBox(height: 24),
                        ProductsHorizontalListView(
                          products: provider.flashSaleProducts,
                          title: "Flash Sale",
                        ),
                        const SizedBox(height: 24),
                        ProductsHorizontalListView(
                          products: provider.megaSaleProducts,
                          title: "Mega Sale",
                        ),
                        const SizedBox(height: 9),
                        RecommendedProductsPanel(products: provider.recommendedProducts),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
