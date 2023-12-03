import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:soodboard/src/modules/product-details/models/review_model.dart';

class ReviewComponent extends StatelessWidget {
  const ReviewComponent({
    super.key,
    required this.review,
  });

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 48,
                width: 48,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    review.user.avatar.file,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.user.name,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  RatingBar.builder(
                    initialRating: review.rate,
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
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            review.comment,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF9098B1),
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 72,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: review.images
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: SizedBox(
                        height: 72,
                        width: 72,
                        child: Image.asset(e.file),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            DateFormat.yMd().add_jm().format(review.dateTime),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF9098B1),
                ),
          ),
        ],
      ),
    );
  }
}
