import 'package:flutter/material.dart';

class CircleSize extends StatelessWidget {
  final String name;

  const CircleSize({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
       child: InkWell(
       child: CircleAvatar(
        backgroundColor: Colors.black26,
         radius: 50,
        child: CircleAvatar(
           backgroundColor: Colors.white,
           radius: 60,
          child: Text(name),
       ),
      ),
    ),
    );

  }


}
