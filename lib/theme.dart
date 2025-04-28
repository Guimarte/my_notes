import 'package:flutter/material.dart';

class ThemeApp {
  static const String light = 'light';
  static const String dark = 'dark';
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  static const List<String> themes = [
    light,
    dark,
  ];
}
