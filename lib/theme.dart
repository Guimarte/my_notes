import 'package:flutter/material.dart';

class ThemeApp {
  static const String light = 'light';
  static const String dark = 'dark';
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white70,
    primaryColor: Colors.grey.shade300,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    colorScheme:
        const ColorScheme.dark(primary: Colors.grey, secondary: Colors.white),
    scaffoldBackgroundColor: Colors.grey.shade900,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  static const List<String> themes = [
    light,
    dark,
  ];
}
