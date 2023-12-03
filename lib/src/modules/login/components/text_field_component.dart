import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    Key? key,
    required this.title,
    this.icon,
    this.maxLines,
  }) : super(key: key);
  final String title;
  final String? icon;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: const Color(0xFF9098B1),
          ),
      maxLines: maxLines,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Color(0xFFEBF0FF),
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Color(0xFFEBF0FF),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Color(0xFFEBF0FF),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Color(0xFFEBF0FF),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Color(0xFFEBF0FF),
          ),
        ),
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(icon!),
              )
            : null,
        hintText: title,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: const Color(0xFF9098B1),
            ),
      ),
      keyboardType: TextInputType.text,
      cursorColor: Colors.blue,
      textAlign: TextAlign.left,
    );
  }
}
