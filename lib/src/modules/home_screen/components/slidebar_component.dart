
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class SlideBarComponent extends StatelessWidget {
  const SlideBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      children:[
        Image.asset(
          "assets/products/home_product_1.png",
          fit: BoxFit.cover,
        ),
        Image.asset(
          "assets/products/home_product_2.png",
          fit: BoxFit.cover,
        ),
        Image.asset(
          "assets/products/home_product_3.png",
          fit: BoxFit.cover,
        ),
      ],
      indicatorColor: Colors.blue,
      autoPlayInterval: 3000,
      isLoop: true,
      onPageChanged: (value)
      {
        debugPrint("page changed: $value");
      },
      width: 343,
      height: 270,
    );
  }
}
