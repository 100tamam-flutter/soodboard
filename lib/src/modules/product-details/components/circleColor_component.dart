import 'package:flutter/material.dart';

class CircleColor extends StatelessWidget {
  final Color customColor;

  const CircleColor({super.key, required this.customColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      child: InkWell(
        child: CircleAvatar(
          radius:49,
          backgroundColor:Colors.indigo,

          child: CircleAvatar(
            radius: 48,
            backgroundColor: customColor,
          ),
        ),
      ),
    );
  }
}
