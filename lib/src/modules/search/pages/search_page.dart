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

class _SearchPage extends StatelessWidget {
  const _SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SearchProvider>();
    final staticProvider = context.read<SearchProvider>();
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
          if (provider.loadingProducts)
            const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.56,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: provider.products.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: ProductTileHalfWidth(
                      productModel: provider.products[index],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
