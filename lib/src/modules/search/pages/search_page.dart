import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/components/product/product_tile_half_width.dart';
import 'package:soodboard/src/modules/search/components/search_appbar.dart';
import 'package:vrouter/vrouter.dart';

import '../providers/search_provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryId = context.vRouter.historyState['category_id'];
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(context: context, categoryId: categoryId),
      child: const _SearchPage(),
    );
  }
}

class _SearchPage extends StatefulWidget {
  const _SearchPage({Key? key}) : super(key: key);

  @override
  State<_SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<_SearchPage> {
  final gridKey = GlobalKey<AnimatedGridState>();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SearchProvider>();
    final staticProvider = context.read<SearchProvider>();
    staticProvider.setGridKey(gridKey);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          SearchAppbar(
            onTextChanged: staticProvider.changeSearchText,
            openSorts: staticProvider.openSorts,
            sortIsSelected: provider.selectedSort != null,
            openCategories: staticProvider.openCategories,
            categorySelected: provider.selectedCategory != null,
          ),
          Expanded(
            child: Stack(
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
          ),
        ],
      ),
    );
  }
}
