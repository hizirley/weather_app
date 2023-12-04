import 'package:flutter/material.dart';

ThemeData DarkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Color.fromARGB(255, 18, 0, 14),
    primary: Color.fromARGB(255, 24, 19, 41)!,
    secondary: Colors.grey[300]!,
    tertiary: Color.fromARGB(255, 63, 47, 72)!,
  )
);