import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:soodboard/src/models/banner_model.dart';

import '../../../components/banner_component.dart';

class HomeBannerSlideBarComponent extends StatelessWidget {
  final List<BannerModel> bannerModels;

  const HomeBannerSlideBarComponent({Key? key, required this.bannerModels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      onPageChanged: (value) {},
      indicatorColor: Colors.blue,
      autoPlayInterval: 3000,
      isLoop: true,
      width: 343,
      height: 270,
      children: bannerModels
          .map((e) => BannerComponent(
                bannerModel: e,
              ))
          .toList(),
    );
  }
}
