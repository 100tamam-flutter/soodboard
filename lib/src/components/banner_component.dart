import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:soodboard/src/models/banner_model.dart';

class BannerComponent extends StatelessWidget {
  const BannerComponent({Key? key, required this.bannerModel}) : super(key: key);
  final BannerModel bannerModel;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime endTime = bannerModel.endTime;
    Duration duration = endTime.difference(now);

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
              margin: const EdgeInsets.only(bottom: 32, left: 32),
              child: SlideCountdownSeparated(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                duration: duration,
                height: 41,
                width: 42,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  color: Color(0xFF223263),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 32, left: 24),
          padding: const EdgeInsets.all(16),
          color: Colors.black.withOpacity(0.5),
          child: Text(
            bannerModel.title,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 30,
                ),
          ),
        )
      ],
    );
  }
}
