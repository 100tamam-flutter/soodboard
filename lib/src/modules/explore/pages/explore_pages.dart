import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
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
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  TextField(
                    // onChanged: (value) => _runFilter(value),
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      suffixIcon: Icon(Icons.search),
                      hintText: "SearchProduct",
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
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: Color(0xFF223263),
                    ),
                  ),
                  const SvgIcon(
                    icon: SvgIconData('assets/icons/love.svg'),
                  ),
                  const SvgIcon(
                    icon: SvgIconData('assets/icons/Notification.svg'),
                  ),
                ],
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
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Man Fashion",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                ),
              ),

              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(21),
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
                          child: SvgIcon(
                            icon: const SvgIconData('assets/icons/shirt.svg'),
                            size: 24,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Man Shirt',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(0xFF9098B1),
                                    letterSpacing: 0.5,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(21),
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
                          child: SvgIcon(
                            icon: const SvgIconData('assets/icons/man bag.svg'),
                            size: 24,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Man Work Equipment',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(0xFF9098B1),
                                    letterSpacing: 0.5,
                                  ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(21),
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
                          child: SvgIcon(
                            icon: const SvgIconData('assets/icons/Tshirt.svg'),
                            size: 24,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Man T-Shirt',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(0xFF9098B1),
                                    letterSpacing: 0.5,
                                  ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(21),
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
                          child: SvgIcon(
                            icon:
                                const SvgIconData('assets/icons/man shoes.svg'),
                            size: 24,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Man Shoes',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(0xFF9098B1),
                                    letterSpacing: 0.5,
                                  ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(21),
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
                          child: SvgIcon(
                            icon:
                                const SvgIconData('assets/icons/man pants.svg'),
                            size: 24,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Man Pants',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(0xFF9098B1),
                                    letterSpacing: 0.5,
                                  ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(21),
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
                          child: SvgIcon(
                            icon: const SvgIconData(
                                'assets/icons/man underwear.svg'),
                            size: 24,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Man Underwear',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(0xFF9098B1),
                                    letterSpacing: 0.5,
                                  ),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Woman Fashion",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                ),
              ),

              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(21),
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
                          child: SvgIcon(
                            icon: const SvgIconData('assets/icons/dress.svg'),
                            size: 24,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Dress',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(0xFF9098B1),
                                    letterSpacing: 0.5,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(21),
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
                          child: SvgIcon(
                            icon: const SvgIconData(
                                'assets/icons/woman tshirt.svg'),
                            size: 24,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Woman T-Shirt',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(0xFF9098B1),
                                    letterSpacing: 0.5,
                                  ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(21),
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
                          child: SvgIcon(
                            icon: const SvgIconData(
                                'assets/icons/woman pants.svg'),
                            size: 24,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Woman Pants',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(0xFF9098B1),
                                    letterSpacing: 0.5,
                                  ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(21),
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
                          child: SvgIcon(
                            icon: const SvgIconData('assets/icons/skirt.svg'),
                            size: 24,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Skirt',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(0xFF9098B1),
                                    letterSpacing: 0.5,
                                  ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(21),
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
                          child: SvgIcon(
                            icon:
                                const SvgIconData('assets/icons/woman bag.svg'),
                            size: 24,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Woman Bag',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(0xFF9098B1),
                                    letterSpacing: 0.5,
                                  ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(21),
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
                          child: SvgIcon(
                            icon: const SvgIconData(
                                'assets/icons/woman shoes.svg'),
                            size: 24,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'High Heels',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(0xFF9098B1),
                                    letterSpacing: 0.5,
                                  ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(21),
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
                          child: SvgIcon(
                            icon: const SvgIconData('assets/icons/bikini.svg'),
                            size: 24,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Bikini',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(0xFF9098B1),
                                    letterSpacing: 0.5,
                                  ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
