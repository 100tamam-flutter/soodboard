import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width/2,
      height: 108,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          SizedBox(width: 16,),
          Category(imagePath: "assets/icons/shirt.svg", title: "Man Shirt"),
          SizedBox(width:12),
          Category(imagePath: "assets/icons/dress.svg", title: "Dress"),
          SizedBox(width: 12),
          Category(imagePath: "assets/icons/man_bag.svg", title: "Man Work Equipment"),
          SizedBox(width: 12),
          Category(imagePath: "assets/icons/woman_bag.svg", title: "Woman Bag"),
          SizedBox(width: 12),
          Category(imagePath: "assets/icons/man_shoes.svg", title: "Man Shoes"),
          SizedBox(width: 16,)
        ],
      ),
    );
  }
}
class Category extends StatelessWidget {
  const Category({Key? key, required this.imagePath, required this.title}) : super(key: key);
  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Column(
          children: [
            Stack(
              alignment:Alignment.center,
              children: [
                Container(

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black12),
                  ),
                  height: 70,
                  width: 70,
                ),
                Container(
                  width: 24 ,
                  height: 24,
                  child: SvgPicture.asset(
                    imagePath,
                  ),
                ),
              ],
            ),

                         Text(
              title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF9B9B9B)
              ),

            )
          ],
        )
    );
  }
}
