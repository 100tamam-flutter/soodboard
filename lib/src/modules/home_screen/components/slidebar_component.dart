import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:soodboard/src/models/banner_model.dart';
import 'banner_component.dart';

class SlideBarComponent extends StatelessWidget {
  final List<BannerModel> bannerModels;

  const SlideBarComponent({Key? key, required this.bannerModels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      // indicatorColor: Colors.blue,
      // autoPlayInterval: 3000,
      isLoop: false,
      onPageChanged: (value) {
      },
      width: 343,
      height: 270,
      children: bannerModels
          .map(
            (e) => BannerComponent(bannerModel: e,)
      )
          .toList(),
    );

  }
}
