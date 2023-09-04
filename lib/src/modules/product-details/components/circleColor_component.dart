import 'package:flutter/material.dart';

class CircleColor extends StatelessWidget {
  final Color customColor;

  const CircleColor({super.key, required this.customColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: InkWell(
        child: CircleAvatar(
          backgroundColor: Colors.black26,
          radius: 50,
          child: CircleAvatar(
            backgroundColor: customColor,
            radius: 60,
      ),
          ),
      )
        );


  }



}