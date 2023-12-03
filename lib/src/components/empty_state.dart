import 'package:flutter/material.dart';
import 'package:soodboard/src/core/localization.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.localizations.emptyData),
    );
  }
}
