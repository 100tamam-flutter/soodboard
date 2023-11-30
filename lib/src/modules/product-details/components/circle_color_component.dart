import 'package:flutter/material.dart';

class CircleColor extends StatelessWidget {
  final String color;

  const CircleColor({
    super.key,
    required this.color,
    required this.selectColor,
    required this.isSelected,
  });

  final Function() selectColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectColor,
      child: Container(
        width: 48,
        height: 48,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Color(int.parse(color))),
        child: isSelected
            ? Center(
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              )
            : null,
      ),
    );
  }
}
