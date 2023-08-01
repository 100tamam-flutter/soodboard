import 'package:gap/gap.dart';
import 'package:flutter/material.dart';

class RecProduct_box extends StatelessWidget {
  late String name;
  late String price;
  late String offer;
  late String percentage;

  RecProduct_box({
    required this.name,
    required this.price,
    required this.offer,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.white54)),
      child: Column(
        children: [
          const Gap(8),
          Image.asset(
            "assets/mock-files/product3.png",
            width: 109,
            height: 109,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            price,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            children: [
              Text(
                percentage,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                offer,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
