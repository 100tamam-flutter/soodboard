import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/modules/explore/components/category_table_component.dart';
import 'package:soodboard/src/modules/explore/components/search_field_component.dart';
import 'package:soodboard/src/modules/explore/models/category_model.dart';
import 'package:soodboard/src/modules/explore/provider/explore_provider.dart';

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
    return Scaffold(
      body: ListView(
        children: const [
          SizedBox(
            height: 20,
          ),
          SearchFieldComponent(),
          SizedBox(
            height: 20,
          ),
          CategoryTableComponent(
            title: "Man Fashion",
            categories: [
              CategoryModel(title: "Man Shirt", icon: "assets/icons/shirt.svg"),
              CategoryModel(title: "Man Shirt", icon: "assets/icons/shirt.svg"),
              CategoryModel(title: "Man Shirt", icon: "assets/icons/shirt.svg"),
              CategoryModel(title: "Man Shirt", icon: "assets/icons/shirt.svg"),
            ],
          ),
          CategoryTableComponent(
            title: "Woman Fashion",
            categories: [
              CategoryModel(title: "Man Shirt", icon: "assets/icons/shirt.svg"),
              CategoryModel(title: "Man Shirt", icon: "assets/icons/shirt.svg"),
              CategoryModel(title: "Man Shirt", icon: "assets/icons/shirt.svg"),
              CategoryModel(title: "Man Shirt", icon: "assets/icons/shirt.svg"),
            ],
          ),
        ],
      ),
    );
  }
}
