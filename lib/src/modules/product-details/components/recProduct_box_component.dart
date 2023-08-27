
import 'package:flutter/material.dart';

import '../models/product_detail_model.dart';

class RecProductComponent extends StatelessWidget {


  const RecProductComponent({Key? key, required this.productDetailModel, required this.offer, required this.before})
      : super(key: key);
  final ProductDetailModel productDetailModel;
  final String before;
  final String offer;

  @override
  Widget build(BuildContext context) {
    var productDetailModel;
    return Container(
      height:240,
      width: 141,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color:Color(0xFFCDCDCD),),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          Image.network(
            productDetailModel.image,
            width: 109,
            height: 109,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
           productDetailModel.title,
            style: Theme
                .of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(overflow: TextOverflow.ellipsis, fontSize:14,
            fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(productDetailModel.price as String,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(
                      color: Color(0xFF40BFFF),
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    )),
              ]),
          SizedBox(
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
                    color: Color(0xFFFF4858),
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
