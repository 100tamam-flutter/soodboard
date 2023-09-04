import 'package:flutter/material.dart';

class CircleColor extends StatelessWidget {
  final Color customColor;

  const CircleColor({super.key, required this.customColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: ElevatedButton(
        onPressed: () {},
        style:
        ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),).merge(ButtonStyle(
          foregroundColor: getColor(Color(customColor as int), Colors.white),
          backgroundColor: getColor(Color(customColor as int), Color(customColor as int)),


        ),),
        child: CircleAvatar(
          radius: 16,
        ),
      ),
    );
  }


  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    final getColor = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    };

    return MaterialStateProperty.resolveWith(getColor);
  }


}