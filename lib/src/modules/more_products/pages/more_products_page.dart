import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/components/product/product_tile_half_width.dart';
import 'package:vrouter/vrouter.dart';

import '../providers/more_products_provider.dart';

class MoreProductsPage extends StatelessWidget {
  const MoreProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sort = context.vRouter.pathParameters['sort'] ?? '';
    return ChangeNotifierProvider(
      create: (context) => MoreProductsProvider(context: context, sort: sort),
      child: const _MoreProductsPage(),
    );
  }
}

class _MoreProductsPage extends StatefulWidget {
  const _MoreProductsPage({Key? key}) : super(key: key);

  @override
  State<_MoreProductsPage> createState() => _MoreProductsPageState();
}

class _MoreProductsPageState extends State<_MoreProductsPage> {
  final gridKey = GlobalKey<AnimatedGridState>();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MoreProductsProvider>();
    final staticProvider = context.read<MoreProductsProvider>();
    staticProvider.setGridKey(gridKey);
    return Scaffold(
      appBar: AppBar(
        title: Text(provider.sort),
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedGrid(
            key: gridKey,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.56,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            initialItemCount: provider.products.length,
            itemBuilder: (context, index, animation) {
              return ScaleTransition(
                scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
                child: Center(
                  child: ProductTileHalfWidth(
                    productModel: provider.products[index],
                  ),
                ),
              );
            },
          ),
          if (provider.loadingProducts)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
