
import 'package:flutter/material.dart';
import 'package:soodboard/src/models/product_model.dart';

class RecProductComponent extends StatelessWidget {


  const RecProductComponent({Key? key, required this.product, required this.offer, required this.before})
      : super(key: key);
  final ProductModel product;
  final String before;
  final String offer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:240,
      width: 141,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color:const Color(0xFFCDCDCD),),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          Image.network(
            product.image,
            width: 109,
            height: 109,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
           product.title,
            style: Theme
                .of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(overflow: TextOverflow.ellipsis, fontSize:14,
            fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(product.price as String,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(
                      color: const Color(0xFF40BFFF),
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    )),
              ]),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                before,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(
                  decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                ),
              ),
              Text(
                offer,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(
                    color: const Color(0xFFFF4858),
                    fontWeight: FontWeight.w700,
                    fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
