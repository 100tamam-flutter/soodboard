import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/components/empty_state.dart';
import 'package:soodboard/src/core/localization.dart';
import 'package:soodboard/src/modules/favorite/components/product_component.dart';

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
    // final staticProvider = context.read<FavoriteProductsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.favoriteProductsAppBar),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        child: provider.loadingProducts
            ? const Center(child: CircularProgressIndicator())
            : provider.products.isEmpty
                ? const EmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: provider.products.length,
                    itemBuilder: (context, index) {
                      return ProductComponent(
                        productModel: provider.products[index],
                      );
                    },
                  ),
      ),
    );
  }
}
