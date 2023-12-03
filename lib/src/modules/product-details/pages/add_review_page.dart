import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:soodboard/src/modules/login/components/text_field_component.dart';
import 'package:vrouter/vrouter.dart';

class AddReviewPage extends StatelessWidget {
  const AddReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.vRouter.pop(),
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
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              "Please write Overall level of satisfaction with your shipping / Delivery Service",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RatingBar.builder(
                  minRating: 1,
                  itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {},
                  initialRating: 0,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Write Your Review",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const TextFieldComponent(
              title: "Write Your Review Here",
              maxLines: 6,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Add Photo",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            FormBuilderImagePicker(
              name: 'Photo',
              backgroundColor: Colors.transparent,
              icon: Icons.add,
              decoration: const InputDecoration(border: InputBorder.none),
              showDecoration: false,
              maxImages: 3,
            ),
          ],
        ),
      ),
    );
  }
}
