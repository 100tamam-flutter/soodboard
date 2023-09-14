import 'package:flutter/material.dart';

class CircleSize extends StatelessWidget {
  final String size;

  const CircleSize({
    super.key,
    required this.size,
    required this.selectSize,
    required this.isSelected,
  });

  final Function() selectSize;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectSize,
      child: Container(
        width: 48,
        height: 48,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? const Color(0xFF40BFFF) : const Color(0xFFEBF0FF),
          ),
        ),
        child: Center(
          child: Text(size),
        ),
      ),
    );
  }
}
