import 'package:flutter/material.dart';

mixin SoodBoardTheme {
  static ThemeData get light => ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        shadowColor: const Color(0xFFE0E0E0),
        highlightColor: const Color(0xFF5AB9E6),
        dividerColor: const Color.fromARGB(255, 140, 140, 140),
        cardColor: const Color.fromARGB(255, 161, 161, 161),
        primaryColor: const Color(0xFF40BFFF),
        scaffoldBackgroundColor: Colors.white,
        disabledColor: const Color(0xFF9B9B9B),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF9098B1),
        ),
        primaryIconTheme: const IconThemeData(
          color: Color(0xFF40BFFF),
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          outline: Color(0xFFCDCDCD),
          primary: Color(0xFF40BFFF),
          onPrimary: Colors.white,
          secondary: Color(0xFFBCDDFE),
          onSecondary: Colors.black,
          error: Color(0xFFFF4858),
          onError: Colors.white,
          background: Colors.white,
          onBackground: Color(0xFF474747),
          surface: Color(0xFFF2F2F2),
          onSurface: Color(0xFF474747),
          errorContainer: Color(0xFFFF4858),
          onErrorContainer: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF40BFFF),
          unselectedItemColor: Color(0xFF9B9B9B),
          showUnselectedLabels: true,
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
              TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFF40BFFF),
              ),
            ),
            foregroundColor: MaterialStatePropertyAll(
              Color(0xFF40BFFF),
            ),
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF223263),
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xFF223263),
          ),
          bodyMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF223263),
          ),
          bodyLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF223263),
          ),
          bodySmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Color(0xFF223263),
          ),
          labelLarge: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF223263),
          ),
          labelSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: Color(0xFF223263),
          ),
          displayLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF3A3A3A),
          ),
          displayMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF474747),
          ),
          displaySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF474747),
          ),
        ),
      );
}
