import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchFieldComponent extends StatelessWidget {
  const SearchFieldComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              // onChanged: (value) => _runFilter(value),
              onChanged: (value) {},
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Color(0xFFEBF0FF),
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Color(0xFFEBF0FF),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Color(0xFFEBF0FF),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Color(0xFFEBF0FF),
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Color(0xFFEBF0FF),
                  ),
                ),
                prefixIcon: Icon(Icons.search,
                color: Color(0xFF40BFFF),
                ),
                hintText: "Search Product",
                hintStyle: TextStyle(
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
                color: Color(0xFF223263),
              ),
            ),
          ),
        ),
        SvgPicture.asset('assets/icons/love.svg'),
        const SizedBox(
          width: 16,
        ),
        SvgPicture.asset('assets/icons/Notification.svg'),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
