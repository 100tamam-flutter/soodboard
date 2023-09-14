import 'package:flutter/material.dart';
import 'package:soodboard/src/modules/product-details/components/circle_color_component.dart';


class SelectColorPanel extends StatelessWidget {
  const SelectColorPanel({
    super.key,
    required this.selectColor,
    required this.colors, required this.selectedColorIndex,
  });

  final Function(int) selectColor;
  final List<String> colors;
  final int? selectedColorIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Color",
            style: Theme.of(context)
                .textTheme
                .titleSmall
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: colors
                  .map(
                    (e) => CircleColor(
                      isSelected: colors.indexOf(e) == selectedColorIndex,
                      color: e,
                      selectColor: () => selectColor(colors.indexOf(e)),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
