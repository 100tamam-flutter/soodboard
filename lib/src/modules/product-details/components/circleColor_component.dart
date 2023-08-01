import 'package:flutter/material.dart';

class CircleColor extends StatelessWidget {
  final Color customColor;

  const CircleColor({super.key, required this.customColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 10,
      backgroundColor: customColor,
    );
  }
}
