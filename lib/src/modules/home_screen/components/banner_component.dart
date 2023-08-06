import 'package:flutter/material.dart';
import 'package:soodboard/src/models/banner_model.dart';
import 'package:slide_countdown/slide_countdown.dart';

class BannerComponent extends StatelessWidget {
  const BannerComponent({Key? key, required this.bannerModel})
      : super(key: key);
  final BannerModel bannerModel;

  @override
  Widget build(BuildContext context) {
     Duration duration = bannerModel.endTime.difference(DateTime.now());

    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Stack(
        alignment: Alignment.bottomLeft,

        children: [
          SizedBox(
            height: 270,
            width: MediaQuery.sizeOf(context).width,
            child: Image.asset(
              bannerModel.image,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 32, left: 32),
            child: SlideCountdownSeparated(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                duration: Duration(hours: 08, minutes: 34, seconds: 52),
                height: 41,
                width: 42,
                textStyle: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xFF223263)
                )

            ),


          ),
          



        ]),
        Text(
            "Super Flash Sale"
            "50% Off",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontSize: 24,
          )

        )
      ]
    );
    
      
  }
}
