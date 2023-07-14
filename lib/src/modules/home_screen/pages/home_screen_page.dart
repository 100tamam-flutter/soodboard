import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              Container(
                  margin: EdgeInsets.all(10),
                  height: 50, width: 400,
                  padding: EdgeInsets.only(top: 12, bottom: 12, left:16, right:16),
                  decoration: BoxDecoration(
                    border:
                    Border.all(
                        color: Colors.black26
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),

                  child:
                  Row(
                    children: [
                      Icon(CupertinoIcons.search, color: Colors.blue),
                      Container(width: 10,),
                      Text(
                        "Search Product",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black38,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal
                        ),
                      ),
                    ],
                  )
              ),
              Icon(CupertinoIcons.heart),
              Container(width: 10),
              Icon(Icons.notifications_none_outlined),
            ],
          ),
          ImageSlideshow(
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
          ),
          Container(
            height: 60,
          ),
           Row(
            children: [
              Container(
                child: Text(
                  "category",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Colors.indigo,

                  ),
                ),
                margin: EdgeInsets.all(10),
              ),
              SizedBox(
                width: 300,
              ),
              Text(
                  "More Category",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Colors.blue
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.white,
              )
            ],
          )
        ],
      ),
    );



  }
}
