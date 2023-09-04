import 'package:flutter/material.dart';

class CircleSize extends StatelessWidget {
  final String name;

  const CircleSize({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: ElevatedButton(onPressed: () {},
          style:
          ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20))).merge(ButtonStyle(
           side: getBorder (Colors.white24, Colors.indigo)


          ),),
          child: Text(name),

    ),// child: InkWell(
    //   child: CircleAvatar(
    //     backgroundColor: Colors.white24,
    //     radius: 49,
    //     child: CircleAvatar(
    //       backgroundColor: Colors.white,
    //       radius: 48,
    //       child: Text(name),
    //     ),
    //   ),
    // ),
    );

  }

  MaterialStateProperty<BorderSide> getBorder(Color color, Color colorPressed) {
    final getBorder = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return BorderSide( color : colorPressed, width:3);
      } else {
        return BorderSide(color: color, width: 2);
      }
    };

    return MaterialStateProperty.resolveWith(getBorder);
  }


}
