import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SSearchField extends StatelessWidget {
  const SSearchField({
    super.key,
    this.isEditable,
    this.onTap,
    this.onTextChanged,
    this.autoFocus,
  });

  final bool? isEditable;
  final bool? autoFocus;
  final Function()? onTap;
  final Function(String)? onTextChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TextField(
        autofocus: autoFocus ?? false,
        enabled: isEditable,
        onChanged: onTextChanged,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xFF9098B1)),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
          ),
          hintText: "Search Product",
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xFF9098B1)),
          prefixIcon: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(
                'assets/icons/Search.svg',
              ),
            ),
          ),
          isDense: true,
        ),
      ),
    );
  }
}
