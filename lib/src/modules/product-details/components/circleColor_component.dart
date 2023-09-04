import 'package:flutter/material.dart';

class CircleColor extends StatelessWidget {
  final Color customColor;

  const CircleColor({super.key, required this.customColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        height: 48,
        width: 48,
        child: CircleAvatar(
          backgroundColor: Colors.black26,
          child: SizedBox(
            height: 44,
            width: 44,
            child: CircleAvatar(
              backgroundColor: customColor,

            ),
          ),
        ),
      ),
    );
  }
}
