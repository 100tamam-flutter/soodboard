import 'package:flutter/material.dart';


class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({Key? key, required this.title,required this.icon}) : super(key: key);
  final String title;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return  TextField(
              // onChanged: (value) => _runFilter(value),
              onChanged: (value) {},
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                prefixIcon: icon,
                hintText: title,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                  color: Color(0xFF9098B1),
                ),
              ),
              keyboardType: TextInputType.text,
              cursorColor: Colors.blue,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: Color(0xFF9098B1),
              ),
            );

  }
}
