import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/modules/explore/provider/search_provider.dart';
import 'package:soodboard/src/models/product_model.dart';
class SearchPage  extends StatefulWidget {
  const SearchPage ({ super.key });

  @override
  State<SearchPage> createState() => _SearchPageState();
}
class _SearchPageState extends State<SearchPage> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Consumer<SearchProvider>(
              builder: (context,
              SearchProvider,_) {
                final products =
                    SearchProvider.products;
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount:products.length,
                    itemBuilder:(context,index) {
                      final product = products[index];
                      return ListTile(
                        title:Text(product.title),
                        leading: Image.network(product.image),
                      );
                    }
                );
              },
          ),

        ],
      ),
    );



  }
}

