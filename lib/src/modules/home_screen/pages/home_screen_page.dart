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
                      const Text(
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
              const Icon(CupertinoIcons.heart),
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
            height: 15,
          ),
          Row(
            children: [
           Container(
             margin: EdgeInsets.only(left: 15, right:10, top:10, bottom:10),
             width: 100.0,
             height: 100.0,
             decoration: BoxDecoration(
               shape: BoxShape.circle,
              color: Colors.white,
               border: Border.all(
                 color: Colors.black26,
               )
        ),
             child: 
             Image.asset("assets/products/shirt.png")
    ),
    Container(
    margin: EdgeInsets.all(10),
    width: 100.0,
    height: 100.0,
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.white,
    border: Border.all(
    color: Colors.black26,
    )
    ),
    child:
    Image.asset("assets/products/dress.png")
    ),
    Container(
    margin: EdgeInsets.all(10),
    width: 100.0,
    height: 100.0,
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.white,
    border: Border.all(
    color: Colors.black26,
    )
    ),
    child:
    Image.asset("assets/products/woman_bag.png"),
    ),
    Container(
    margin: EdgeInsets.only(right: 15, left: 10, top:10, bottom:10),
    width: 100.0,
    height: 100.0,
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.white,
    border: Border.all(
    color: Colors.black26,
    )
    ),
    child:
    Image.asset("assets/products/man_bag.png")
    )
            ],
          ),
          Row(
            children: [
              Container(
                child: Text(
                  "Flash Sale",
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
                width: 320,
              ),
              Text(
                "See More",
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
          Row(
           children: [
             ElevatedButton(
                 onPressed: (){},
                 child: Container(
                   width: 109,
                   height: 206,
                   margin: EdgeInsets.all(10),
                   padding: EdgeInsets.all(16),
                   decoration: BoxDecoration(
                     border: Border.all(
                       color: Colors.black26,
                     ),
                     borderRadius: BorderRadius.circular(5),
                     color: Colors.white
                   ),
                   child: Column(
                     children: [
                       Image.asset(
                         "assets/products/home_product_2.png",


                       ),
                       Text(
                         "FS - Nike Air Max 270 React...",
                         style: TextStyle(
                             fontFamily: "Poppins",
                             fontWeight: FontWeight.w700,
                             fontStyle: FontStyle.normal,
                             fontSize: 12,
                             color: Colors.indigo,
                         ),
                       ),
                       Text(
                           "299,43",
                         style: TextStyle(
                           fontFamily: "Poppins",
                           fontWeight: FontWeight.w700,
                           fontStyle: FontStyle.normal,
                           fontSize: 12,
                           color: Colors.blue
                       ),
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Text(
                             "534,33",
                             style: TextStyle(
                               fontFamily: "Poppins",
                               fontStyle: FontStyle.normal,
                               fontSize: 10,
                               color: Colors.black26,

                             ),
                           ),
                           Text(
                             "24% Off",
                             style: TextStyle(
                               fontFamily: "Poppins",
                               fontStyle: FontStyle.normal,
                               fontSize: 10,
                               color: Colors.red,
                             ),
                           ),


                         ],
                       )
                     ],
                   )
                 ),

             ),
             SizedBox(width: 10),
             ElevatedButton(
               onPressed: (){},
               child: Container(
                   width: 109,
                   height: 206,
                   margin: EdgeInsets.all(10),
                   padding: EdgeInsets.all(16),
                   decoration: BoxDecoration(
                       border: Border.all(
                         color: Colors.black26,
                       ),
                       borderRadius: BorderRadius.circular(5),
                       color: Colors.white
                   ),
                   child: Column(
                     children: [
                       Image.asset(
                         "assets/products/home_product_3.png",
                       ),
                       Text(
                         "FS - QUILTED MAXI CROS...",
                         style: TextStyle(
                           fontFamily: "Poppins",
                           fontWeight: FontWeight.w700,
                           fontStyle: FontStyle.normal,
                           fontSize: 12,
                           color: Colors.indigo,
                         ),
                       ),
                       Text(
                         "299,43",
                         style: TextStyle(
                             fontFamily: "Poppins",
                             fontWeight: FontWeight.w700,
                             fontStyle: FontStyle.normal,
                             fontSize: 12,
                             color: Colors.blue
                         ),
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(
                             "534,33",
                             style: TextStyle(
                               fontFamily: "Poppins",
                               fontStyle: FontStyle.normal,
                               fontSize: 10,
                               color: Colors.black26,

                             ),
                           ),
                           Text(
                             "24% Off",
                             style: TextStyle(
                               fontFamily: "Poppins",
                               fontStyle: FontStyle.normal,
                               fontSize: 10,
                               color: Colors.red,
                             ),
                           ),


                         ],
                       )
                     ],
                   )
               ),

             ),
             SizedBox(width: 10),
             ElevatedButton(
               onPressed: (){},
               child: Container(
                   width: 109,
                   height: 206,
                   margin: EdgeInsets.all(10),
                   padding: EdgeInsets.all(16),
                   decoration: BoxDecoration(
                       border: Border.all(
                         color: Colors.black26,
                       ),
                       borderRadius: BorderRadius.circular(5),
                       color: Colors.white
                   ),
                   child: Column(
                     children: [
                       Image.asset(
                         "assets/products/home_product_1.png",
                       ),
                       Text(
                         "FS - QUILTED MAXI CROS...",
                         style: TextStyle(
                           fontFamily: "Poppins",
                           fontWeight: FontWeight.w700,
                           fontStyle: FontStyle.normal,
                           fontSize: 12,
                           color: Colors.indigo,
                         ),
                       ),
                       Text(
                         "299,43",
                         style: TextStyle(
                             fontFamily: "Poppins",
                             fontWeight: FontWeight.w700,
                             fontStyle: FontStyle.normal,
                             fontSize: 12,
                             color: Colors.blue
                         ),
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(
                             "534,33",
                             style: TextStyle(
                               fontFamily: "Poppins",
                               fontStyle: FontStyle.normal,
                               fontSize: 10,
                               color: Colors.black26,

                             ),
                           ),
                           Text(
                             "24% Off",
                             style: TextStyle(
                               fontFamily: "Poppins",
                               fontStyle: FontStyle.normal,
                               fontSize: 10,
                               color: Colors.red,
                             ),
                           ),


                         ],
                       )
                     ],
                   )
               ),

             ),
           ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Container(
                child: Text(
                  "More Sale",
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
                width: 320,
              ),
              Text(
                "See More",
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
          Row(
            children: [
              ElevatedButton(
                onPressed: (){},
                child: Container(
                    width: 109,
                    height: 206,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/products/home_product_2.png",


                        ),
                        Text(
                          "FS - Nike Air Max 270 React...",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                            color: Colors.indigo,
                          ),
                        ),
                        Text(
                          "299,43",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: Colors.blue
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "534,33",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 10,
                                color: Colors.black26,

                              ),
                            ),
                            Text(
                              "24% Off",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 10,
                                color: Colors.red,
                              ),
                            ),


                          ],
                        )
                      ],
                    )
                ),

              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: (){},
                child: Container(
                    width: 109,
                    height: 206,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/products/home_product_3.png",
                        ),
                        Text(
                          "FS - QUILTED MAXI CROS...",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                            color: Colors.indigo,
                          ),
                        ),
                        Text(
                          "299,43",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: Colors.blue
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "534,33",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 10,
                                color: Colors.black26,

                              ),
                            ),
                            Text(
                              "24% Off",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 10,
                                color: Colors.red,
                              ),
                            ),


                          ],
                        )
                      ],
                    )
                ),

              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: (){},
                child: Container(
                    width: 109,
                    height: 206,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/products/home_product_1.png",
                        ),
                        Text(
                          "FS - QUILTED MAXI CROS...",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                            color: Colors.indigo,
                          ),
                        ),
                        Text(
                          "299,43",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: Colors.blue
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "534,33",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 10,
                                color: Colors.black26,

                              ),
                            ),
                            Text(
                              "24% Off",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 10,
                                color: Colors.red,
                              ),
                            ),


                          ],
                        )
                      ],
                    )
                ),

              ),
            ],
          ),
        ],
      ),
    );



  }
}
