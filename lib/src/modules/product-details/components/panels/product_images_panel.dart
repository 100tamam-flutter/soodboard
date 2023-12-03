import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ProductImagesPanel extends StatelessWidget {
  const ProductImagesPanel({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 238,
      child: ImageSlideshow(
        indicatorColor: Colors.blue,
        autoPlayInterval: 3000,
        isLoop: true,
        children: images
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
