import 'package:flutter/material.dart';

class CircleSize extends StatelessWidget {
  final String name;

  const CircleSize({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:65,
      child: InkWell(
        child: CircleAvatar(
          backgroundColor: Colors.indigo,
          radius: 49,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 48,
            child: Text(name),
          ),
        ),
      ),
    );
  }
}
