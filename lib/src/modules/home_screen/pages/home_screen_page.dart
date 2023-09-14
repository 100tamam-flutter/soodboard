import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/components/product/products_horizontal_listview.dart';
import 'package:soodboard/src/modules/home_screen/components/categories_panel.dart';
import 'package:soodboard/src/modules/home_screen/components/home_search_bar.dart';
import 'package:soodboard/src/modules/home_screen/components/recommended_products_panel.dart';
import 'package:soodboard/src/modules/home_screen/components/home_banner_slidebar_component.dart';
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
                const HomeSearchBar(),
                const SizedBox(height: 32),
                HomeBannerSlideBarComponent(bannerModels: provider.banners),
                const SizedBox(height: 24),
                CategoriesPanel(categories: provider.categories),
                const SizedBox(height: 24),
                ProductsHorizontalListView(
                    products: provider.flashSaleProducts),
                const SizedBox(height: 24),
                ProductsHorizontalListView(products: provider.megaSaleProducts),
                const SizedBox(height: 9),
                RecommendedProductsPanel(products: provider.recommendedProducts)
              ],
            ),
    );
  }
}
