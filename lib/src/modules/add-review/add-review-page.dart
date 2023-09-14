import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import '../products-review/products-review-page.dart';
import 'package:vrouter/vrouter.dart';


class AddReview extends StatelessWidget {
  const AddReview({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.vRouter.to('/productReview', isReplacement: true);

            },
            icon: SvgPicture.asset("assets/icons/Left.svg"),
          ),
          title: Text(
            "Write Review",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      "Please write Overall level of satisfaction with your shipping / Delivery Service",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RatingBar.builder(
                          minRating: 1,
                          itemBuilder: (context, _) =>
                              Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (rating) {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Write Your Review",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Review',
                            hintText: "Write Your Review Here"),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Add Photo",
                          style:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                     Container(
                       decoration: BoxDecoration(
                         border: Border.all(width: 1, color:const Color(0xFFCDCCDD),),
                         borderRadius: const BorderRadius.all(Radius.circular(5)),
                       ),

                      child: Expanded(
                        child: FormBuilderImagePicker(

                          name: 'Photo',
                          backgroundColor: Colors.transparent,
                          icon: Icons.add,
                          decoration: const InputDecoration(

                          ),
                          showDecoration: true,
                          maxImages: 3,

                          // initialValue: const [
                          //   'https://images.pexels.com/photos/7078045/pexels-photo-7078045.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                          // ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
