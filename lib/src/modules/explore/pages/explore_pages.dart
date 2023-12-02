import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/components/empty_state.dart';
import 'package:soodboard/src/modules/explore/components/category_table_component.dart';
import 'package:soodboard/src/modules/explore/provider/explore_provider.dart';
import 'package:soodboard/src/modules/home/components/home_search_bar.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExploreProvider(context),
      child: const _ExplorePage(),
    );
  }
}

class _ExplorePage extends StatelessWidget {
  const _ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ExploreProvider>();
    // final staticProvider = context.read<FavoriteProductsProvider>();
    return SafeArea(
      child: Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          child: provider.loadingCategories
              ? const Center(child: CircularProgressIndicator())
              : provider.categories.isEmpty
                  ? const EmptyState()
                  : Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        HomeSearchBar(),
                        const SizedBox(
                          height: 16,
                        ),
                        const Divider(
                          color: Color(0xFFEBF0FF),
                          height: 1,
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              CategoryTableComponent(
                                title: "Man Fashion",
                                categories: provider.categories.where((element) => element.gender == 'male').toList(),
                              ),
                              CategoryTableComponent(
                                title: "Woman Fashion",
                                categories: provider.categories.where((element) => element.gender == 'female').toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
