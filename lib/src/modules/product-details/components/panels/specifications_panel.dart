import 'package:flutter/material.dart';

class SpecificationsPanel extends StatelessWidget {
  const SpecificationsPanel({
    super.key,
    required this.description,
    required this.style,
    required this.shown,
  });

  final String description;
  final String style;
  final String shown;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Specification",
            style: Theme.of(context)
                .textTheme
                .titleSmall,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shown:",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium,
              ),
              const SizedBox(width: 100,),
              Expanded(
                child: Text(
                  shown,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF9098B1),
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Style",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium,
              ),
              Text(
                style,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF9098B1),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
