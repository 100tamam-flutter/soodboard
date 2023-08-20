import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:soodboard/src/models/product_model.dart';

class RecomendedProductComponent extends StatelessWidget {
  const RecomendedProductComponent ({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 165,
      height: 282,
      child: InkWell(
        onTap: () {},
        child: 
            Container(
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFFEBF0FF),
                )
              ),
              child: Column(
                  children: [
                    Image.asset(productModel.image),
                    const SizedBox(height: 5,),
                    Text(productModel.title),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        RatingBar.builder(
                          itemSize: 10,
                          initialRating: 3,
                          minRating: 0.5,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [Text(
                        productModel.price.toString(),
                        style:  Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: const Color(0xFF40BFFF),
                        ),
                      ),],
                    ),
                    Row(
                      children: [
                        Text(
                          productModel.previousPrice.toString(),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SizedBox(width: 5,),
                        Text(
                          '${productModel.discount}%',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    )
                  ]
              ),
            )
        
        

      ),
    );
  }
}

