import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

class _FavoriteProductsPage extends StatefulWidget {
  const _FavoriteProductsPage({Key? key}) : super(key: key);

  @override
  State<_FavoriteProductsPage> createState() => _FavoriteProductsPageState();
}

class _FavoriteProductsPageState extends State<_FavoriteProductsPage> {
  final gridKey = GlobalKey<AnimatedGridState>();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FavoriteProductsProvider>();
    final staticProvider = context.read<FavoriteProductsProvider>();
    staticProvider.setGridKey(gridKey);
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
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedGrid(
                key: gridKey,
                padding: const EdgeInsets.all(16),
                initialItemCount: provider.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.56,
                ),
                itemBuilder: (context, index, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: Center(
                      child: ProductTileHalfWidth(
                        productModel: provider.products[index],
                        onRemove: () => staticProvider.removeItem(index),
                      ),
                    ),
                  );
                },
              ),
              if (provider.loadingProducts)
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          )),
    );
  }
}
