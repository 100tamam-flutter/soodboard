import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ProductImagesPanel extends StatelessWidget {
  const ProductImagesPanel({
    super.key,
    required this.firstImage,
    required this.secondImage,
    required this.thirdImage,
  });

  final String firstImage;
  final String secondImage;
  final String thirdImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 238,
      child: ImageSlideshow(
        indicatorColor: Colors.blue,
        autoPlayInterval: 3000,
        isLoop: true,
        children: [firstImage, secondImage, thirdImage]
            .map(
              (e) => Image.asset(
                e,
                fit: BoxFit.cover,
              ),
            )
            .toList(),
      ),
    );
  }
}
