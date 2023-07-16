import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/models/product_model.dart';
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
          const  SizedBox(
            height: 20,
          ),
          TextField(
            // onChanged: (value) => _runFilter(value),
            onChanged: (value) {},
            decoration: const InputDecoration(
                labelText: "search", suffixIcon: Icon(Icons.search)),
          ),
          const  SizedBox(
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
          const  Text(
            "ManFashion",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.white,
                    shape: const CircleBorder(),
                  ),

                  onPressed:(){},

                  child: ElevatedButton.icon(
                    onPressed:(){},
                    icon: const Icon(Icons.add_a_photo_outlined),
                    label: const Text("ManShirt"),
                  ),
                ),
              ),

              Container(
                padding:const  EdgeInsets.all(8.0),
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.white,
                    shape: const CircleBorder(),
                  ),

                  onPressed:(){},
                  child: ElevatedButton.icon(
                    onPressed:(){},
                    icon: const Icon(Icons.add_a_photo_outlined),
                    label: const Text("ManWorkEquipMent"),
                  ),
                ),
              ),


              Container(
                padding: const EdgeInsets.all(8.0),
                child:  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.white,
                    shape: const CircleBorder(),
                  ),

                  onPressed:(){},
                  child: ElevatedButton.icon(
                    onPressed:(){},
                    icon: const Icon(Icons.add_a_photo_outlined),
                    label: const Text("ManT_Shirt"),
                  ),
                ),
              ),

              Container(
                padding: const  EdgeInsets.all(8.0),
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.white,
                    shape: const CircleBorder(),
                  ),

                  onPressed:(){},
                  child: ElevatedButton.icon(
                    onPressed:(){},
                    icon: const Icon(Icons.add_a_photo_outlined),
                    label: const Text("ManShoes"),
                  ),
                ),
              ),


            ],
          ),
          Row(
            children: [
              Container(
                padding: const  EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.white,
                    shape: const CircleBorder(),
                  ),

                  onPressed:(){},
                  child: ElevatedButton.icon(
                    onPressed:(){},
                    icon: const Icon(Icons.add_a_photo_outlined),
                    label: const Text("ManPants"),
                  ),
                ),
              ),

              Container(
                padding: const  EdgeInsets.all(8.0),
                child:
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.white,
                    shape: const CircleBorder(),
                  ),

                  onPressed:(){},
                  child: ElevatedButton.icon(
                    onPressed:(){},
                    icon: const Icon(Icons.add_a_photo_outlined),
                    label: const Text("ManUnderWare"),
                  ),
                ),
              ),

            ],
          ),

          const  Text(
            "WomanFashion",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.white,
                    shape: const CircleBorder(),
                  ),

                  onPressed:(){},
                  child: ElevatedButton.icon(
                    onPressed:(){},
                    icon: const Icon(Icons.add_a_photo_outlined),
                    label:const Text("Dress"),
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.all(8.0),
                child:
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.white,
                    shape:const CircleBorder(),
                  ),

                  onPressed:(){},
                  child: ElevatedButton.icon(
                    onPressed:(){},
                    icon: const Icon(Icons.add_a_photo_outlined),
                    label: const Text("WomanT_Shirt"),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.white,
                    shape: const CircleBorder(),
                  ),

                  onPressed:(){},
                  child: ElevatedButton.icon(
                    onPressed:(){},
                    icon: const Icon(Icons.add_a_photo_outlined),
                    label: const Text("WomanPants"),
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.white,
                    shape: const CircleBorder(),
                  ),

                  onPressed:(){},
                  child: ElevatedButton.icon(
                    onPressed:(){},
                    icon: const Icon(Icons.add_a_photo_outlined),
                    label: const Text("Skirt"),
                  ),
                ),
              ),


            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.white,
                    shape: const CircleBorder(),
                  ),

                  onPressed:(){},
                  child: ElevatedButton.icon(
                    onPressed:(){},
                    icon: const Icon(Icons.add_a_photo_outlined),
                    label: const Text("WomanBag"),
                  ),
                ),
              ),


              Container(
                padding: const EdgeInsets.all(8.0),
                child:  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.white,
                    shape: const CircleBorder(),
                  ),

                  onPressed:(){},
                  child: ElevatedButton.icon(
                    onPressed:(){},
                    icon: const Icon(Icons.add_a_photo_outlined),
                    label: const Text("HighHeels"),
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.white,
                    shape: const CircleBorder(),
                  ),

                  onPressed:(){},
                  child: ElevatedButton.icon(
                    onPressed:(){},
                    icon: const Icon(Icons.add_a_photo_outlined),
                    label: const Text("Bikini"),
                  ),
                ),
              ),


            ],
          ),

        ],
      ),
    );
  }
}

