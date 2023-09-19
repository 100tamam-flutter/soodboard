import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/modules/search-screem/components/vertical-products-components.dart';
import '../../../components/product/product_tile_half_width.dart';
import '../../../models/product_model.dart';
import '../../home_screen/providers/home_screen_provider.dart';
import '../../products-review/products-review-page.dart';
import 'package:vrouter/vrouter.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenProvider(context),
      child: const _SearchPage(),
    );
  }
}

class _SearchPage extends StatelessWidget {
  const _SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeScreenProvider>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: provider.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: TextField(
                            onTap: () {
                              context.vRouter
                                  .to('/search', isReplacement: true);
                            },
                            // onChanged: (value) => _runFilter(value),
                            onChanged: (value) {},
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                  color: Color(0xFFEBF0FF),
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                  color: Color(0xFFEBF0FF),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                  color: Color(0xFFEBF0FF),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                  color: Color(0xFFEBF0FF),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
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
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                              color: Color(0xFF223263),
                            ),
                          ),
                        ),
                      ),
                      SvgPicture.asset('assets/icons/Short icon.svg'),
                      const SizedBox(
                        width: 16,
                      ),
                      SvgPicture.asset('assets/icons/Filter.svg'),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                       "145 results" ,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF9098B1)),
                      ),
                      Container(
                        width: 110,
                        child: Row(
                          children: [
                            Text(
                              "Man shoes",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            SvgPicture.asset('assets/icons/Down Icon.svg'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Expanded(
                      child: VerticalProducts(
                          products: provider.recommendedProducts)),
                ],
              ),
      ),
    );
  }
}
