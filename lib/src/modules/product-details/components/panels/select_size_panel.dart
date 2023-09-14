import 'package:flutter/material.dart';

import '../circle_size_component.dart';

class SelectSizePanel extends StatelessWidget {
  const SelectSizePanel({
    super.key,
    required this.selectSize,
    required this.sizes, required this.selectedSizeIndex,
  });

  final Function(int) selectSize;
  final List<String> sizes;
  final int? selectedSizeIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Size",
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: sizes
                  .map(
                    (e) => CircleSize(
                      isSelected: sizes.indexOf(e) == selectedSizeIndex,
                      size: e,
                      selectSize: () => selectSize(sizes.indexOf(e)),
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
