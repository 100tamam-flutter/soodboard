import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/components/empty_state.dart';
import 'package:soodboard/src/components/product/product_tile_half_width.dart';
import 'package:soodboard/src/core/localization.dart';
import 'package:vrouter/vrouter.dart';

import '../providers/favorite_products_provider.dart';

class FavoriteProductsPage extends StatelessWidget {
  const FavoriteProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProductsProvider(context),
      child: const _FavoriteProductsPage(),
    );
  }
}

class _FavoriteProductsPage extends StatelessWidget {
  const _FavoriteProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FavoriteProductsProvider>();
    final staticProvider = context.read<FavoriteProductsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.favoriteProductsAppBar),
        leading: Padding(
          padding: const EdgeInsets.all(16),
          child: InkWell(
            onTap: () => context.vRouter.pop(),
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        titleSpacing: 0,
        leadingWidth: 52,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        child: provider.loadingProducts
            ? const Center(child: CircularProgressIndicator())
            : provider.products.isEmpty
                ? const EmptyState()
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: provider.products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.56,
                    ),
                    itemBuilder: (context, index) {
                      return Center(
                        child: ProductTileHalfWidth(
                          productModel: provider.products[index],
                          onRemove: () => staticProvider.removeItem(index),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
