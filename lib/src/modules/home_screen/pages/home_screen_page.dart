import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/modules/home_screen/components/category_component.dart';
import 'package:soodboard/src/modules/home_screen/components/slidebar_component.dart';

import '../../home_screen/providers/home_screen_provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenProvider(context),
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeScreenProvider>();
    return Scaffold(
      body: provider.loadingBanners
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                          left: 10,
                          right: 10,
                        ),
                        child: TextFormField(
                          style: Theme.of(context).textTheme.displaySmall,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              hintText: "Search Product",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(16),
                                child: SvgPicture.asset(
                                  'assets/icons/search.svg',
                                ),
                              ),
                              isDense: true),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                        right: 8,
                        left: 16,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/love.svg',
                        height: 24,
                        width: 24,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                        left: 8,
                        right: 16,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/notification.svg',
                        height: 24,
                        width: 24,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                SlideBarComponent(bannerModels: provider.banners),
                const SizedBox(height: 48,),
                Row(
                  children: [
                    Container(
                      margin:const EdgeInsets.only(left: 16),
                        child: Text(
                          "Category",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),

                    ),
                    const Expanded(child: SizedBox()),
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: Text(
                          "More Category",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: const Color(0xFF40BFFF),
                        )

                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                const CategoryComponent(),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      margin:const EdgeInsets.only(left: 16),
                      child: Text(
                        "Flash Sale",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),

                    ),
                    const Expanded(child: SizedBox()),
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: Text(
                          "See More",
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: const Color(0xFF40BFFF),
                          )

                      ),
                    )
                  ],
                ),

              ],
            ),
    );
  }
}
