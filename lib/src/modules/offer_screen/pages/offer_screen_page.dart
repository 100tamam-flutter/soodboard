import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/components/slidebar_component.dart';
import '../../home_screen/components/recomended_product_component.dart';
import '../../home_screen/providers/home_screen_provider.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenProvider(context),
      child: const _OfferScreen(),
    );
  }
}

class _OfferScreen extends StatelessWidget {
  const _OfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeScreenProvider>();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: Icon(
          Icons.keyboard_arrow_left,
          size: 24,
          color: Color(0xFF9098B1),
        ),
        title: Text(
            "Super Flash Sale",
            style: Theme
                .of(context)
                .textTheme
                .labelSmall
                ?.copyWith(
              fontSize: 16,
            )
        ),
        titleSpacing: 12,
        actions: [
          Container(
            margin: EdgeInsets.all(16),
            child: InkWell(
              child: SvgPicture.asset("icons/Search_2.svg"),
              onTap: () {},
            ),
          )
        ],
      ),
      body: provider.loading
          ? const Center(
           child: CircularProgressIndicator(),
      )
          : ListView(
              children: [
                const SizedBox(height: 20),
                SlideBarComponent(bannerModels: provider.banners),
                    Wrap(
                      children: provider.products
                          .map((e) => RecomendedProductComponent(productModel: e))
                          .toList(),
                    ),
                  ],
                )



    );
  }
}

