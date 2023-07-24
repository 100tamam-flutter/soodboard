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
            height: 16,
          ),
          SearchFieldComponent(),
          SizedBox(
            height: 16,
          ),
            Divider(
              color: Color(0xFFEBF0FF),
             height: 1,
            ),
              CategoryTableComponent(
              title: "Man Fashion",
              categories: [
                CategoryModel(title: "Man Shirt", icon: "assets/icons/shirt.svg"),
                CategoryModel(title: "Man Work Equipment", icon: "assets/icons/man_bag.svg"),
                CategoryModel(title: "Man T-Shirt", icon: "assets/icons/T-shirt.svg"),
                CategoryModel(title: "Man Shoes", icon: "assets/icons/man_shoes.svg"),
                CategoryModel(title: "Man Pants", icon: "assets/icons/man_pants.svg"),
                CategoryModel(title: "Man Underwear", icon: "assets/icons/man_underwear.svg"),
              ],
            ),


          CategoryTableComponent(
            title: "Woman Fashion",
            categories: [
              CategoryModel(title: "Dress", icon: "assets/icons/dress.svg"),
              CategoryModel(title: "Woman T-Shirt", icon: "assets/icons/woman_T-shirt.svg"),
              CategoryModel(title: "Woman Pants", icon: "assets/icons/woman_pants.svg"),
              CategoryModel(title: "Skirt", icon: "assets/icons/skirt.svg"),
              CategoryModel(title: "Woman Bag", icon: "assets/icons/woman_bag.svg"),
              CategoryModel(title: "High Heels", icon: "assets/icons/woman_shoes.svg"),
              CategoryModel(title: "Bikini", icon: "assets/icons/bikini.svg"),
            ],
          ),
        ],
      ),
    );
  }
}
