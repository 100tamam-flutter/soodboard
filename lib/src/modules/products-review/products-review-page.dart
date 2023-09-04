import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ProductsReview extends StatelessWidget {
  const ProductsReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/Left.svg"),
        ),
        title:Text(
          "5 Reviews",
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children:[
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/mock-files/profile-picture.svg'),
                          radius: 48,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              "James Lawson",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                  fontWeight: FontWeight.w700),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: SizedBox(
                                width: 96,
                                height: 16,
                                child: SvgPicture.asset(
                                  'assets/icons/star_rating.svg',
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(

                            height:72,
                            width:72 ,
                            child: Image.asset('assets/mock-files/product1.png')),
                        SizedBox(
                            height:72,
                            width:72 ,
                            child: Image.asset('assets/mock-files/product1-2.png')),

                      ],
                    ),
                    Text(
                      "December 10, 2016",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/mock-files/laura.svg'),
                          radius: 48,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              "Laura Octavian",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                  fontWeight: FontWeight.w700),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: SizedBox(
                                width: 96,
                                height: 16,
                                child: SvgPicture.asset(
                                  'assets/icons/star_rating.svg',
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("This is really amazing product, i like the design of product, I hope can buy it again!",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),


                    Text(
                      "December 10, 2016",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/mock-files/jhonson.svg'),
                          radius: 48,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              "Jhonson Bridge",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                  fontWeight: FontWeight.w700),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: SizedBox(
                                width: 96,
                                height: 16,
                                child: SvgPicture.asset(
                                  'assets/icons/full-star_rating.svg',
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),


                    Text(
                      "December 10, 2016",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/mock-files/griffin.svg'),
                          radius: 48,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              "Griffin Rod",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                  fontWeight: FontWeight.w700),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: SizedBox(
                                width: 96,
                                height: 16,
                                child: SvgPicture.asset(
                                  'assets/icons/full-star_rating.svg',
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small  ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(

                            height:72,
                            width:72 ,
                            child: Image.asset('assets/mock-files/product1.png')),
                        SizedBox(
                            height:72,
                            width:72 ,
                            child: Image.asset('assets/mock-files/product1-2.png')),

                      ],
                    ),


                    Text(
                      "December 10, 2016",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),



              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 57,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Write Review",
                  style:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
