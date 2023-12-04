import 'package:flutter/material.dart';
import 'package:weather_app/pages/choose_city.dart';
import 'package:weather_app/theme/dark_theme.dart';
import 'package:weather_app/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme, // Varsayılan tema
      darkTheme: DarkTheme, // Koyu tema
      home: ChooseCity(),
    );
  }
}
