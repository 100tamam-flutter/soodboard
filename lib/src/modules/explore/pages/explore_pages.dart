import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextField(
            // onChanged: (value) => _runFilter(value),
            onChanged: (value) {},
            decoration: const InputDecoration(
                labelText: "search", suffixIcon: Icon(Icons.search)),
          ),
          const SizedBox(
            height: 20,
          ),
          // Expanded(
          //     child: ListView.builder(
          //       itemCount: _foundProducts.length,
          //       itemBuilder: (context, index) => Card(
          //         key: ValueKey(_foundProducts[index]['id']),
          //         color: Colors.white,
          //         elevation: 4,
          //         margin: const EdgeInsets.symmetric(vertical: 10),
          //         child: ListTile(
          //           leading: Text(
          //             _foundProducts[index]['id'].toString(),
          //             style: const TextStyle( fontSize: 24, color: Colors.white),
          //           ),
          //           title: Text(
          //             _foundProducts[index]['title'],
          //             style: const TextStyle(color: Colors.white),
          //           ),
          //           subtitle: Text(
          //               '${_foundProducts[index]['price'].toString()}years old',
          //               style:const TextStyle(color: Colors.white)),
          //         ),
          //       ),
          //     )),
          const Text(
            "ManFashion",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        fixedSize: const Size(70, 70),
                      ),
                      onPressed: () {},
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Man Shirt',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: const Color(0xFF9098B1),
                          ),
                    )
                  ],
                ),
              ),
            ],
          ),

          const Text(
            "WomanFashion",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
