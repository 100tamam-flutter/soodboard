import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:soodboard/src/modules/product-details/models/review_model.dart';

import '../review_component.dart';

class ReviewPanel extends StatelessWidget {
  const ReviewPanel({
    super.key,
    required this.productRating,
    required this.reviewsNumber,
    required this.firstReview,
    required this.openReviews,
  });

  final double productRating;
  final int reviewsNumber;
  final ReviewModel firstReview;
  final Function() openReviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Review Product",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              InkWell(
                onTap: openReviews,
                child: Text(
                  "See More",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: const Color(0xFF40BFFF),
                      ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              RatingBar.builder(
                initialRating: productRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                ignoreGestures: true,
                itemCount: 5,
                itemSize: 16,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                productRating.toString(),
                style: Theme.of(context).textTheme.labelSmall!.copyWith(color: const Color(0xFF9098B1)),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                '($reviewsNumber Reviews)',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: const Color(0xFF9098B1)),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ReviewComponent(review: firstReview),
      ],
    );
  }
}
