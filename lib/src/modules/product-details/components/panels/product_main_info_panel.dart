import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soodboard/src/modules/product-details/models/product_detail_model.dart';

class ProductMainInfoPanel extends StatefulWidget {
  const ProductMainInfoPanel({super.key, required this.productDetail});

  final ProductDetailModel productDetail;

  @override
  State<ProductMainInfoPanel> createState() => _ProductMainInfoPanelState();
}

class _ProductMainInfoPanelState extends State<ProductMainInfoPanel> {
  bool click = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  widget.productDetail.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              ElevatedButton(

                onPressed: (){
                  setState(() {
                   click =  !click;
                  });
                },
              child: click == false ? SvgPicture.asset("assets/icons/love.svg"): SvgPicture.asset("assets/icons/redlove.svg"),
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.transparent,
                 foregroundColor: Colors.transparent,
               ),

               ),
              ]
          ),

          const SizedBox(
            height: 8,
          ),
          RatingBar.builder(
            initialRating: widget.productDetail.rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            ignoreGestures: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.only(right: 2.0),
            itemSize: 16,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {},
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "\$${widget.productDetail.price}",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: const Color(0xFF40BFFF),
                ),
          ),
        ],
      ),
    );
  }
}
