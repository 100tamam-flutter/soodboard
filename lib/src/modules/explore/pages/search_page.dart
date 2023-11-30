import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/modules/explore/provider/search_provider.dart';
import 'package:vrouter/vrouter.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchText = context.vRouter.historyState['search_text'] ?? '';
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(context, searchText),
      child: const _SearchPage(),
    );
  }
}

class _SearchPage extends StatelessWidget {
  const _SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SearchProvider>();
    return Scaffold(
      body:
          Padding(padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                onChanged: (v) => provider.getProducts(v),
                decoration: const InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Color(0xFFEBF0FF),
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Color(0xFFEBF0FF),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Color(0xFFEBF0FF),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Color(0xFFEBF0FF),
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Color(0xFFEBF0FF),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF40BFFF),
                  ),
                  hintText: "Search Product",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    color: Color(0xFF9098B1),
                  ),
                ),
                keyboardType: TextInputType.text,
                cursorColor: Colors.blue,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                  color: Color(0xFF223263),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.products.length,
                  itemBuilder: (context, index) {
                    final product = provider.products[index];
                    return ListTile(
                      title: Text(product.title),
                      leading: Image.network(product.image),
                    );
                  }),
            ],
          ),
          ),


    );
  }
}
