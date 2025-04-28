import 'package:flutter/material.dart';

abstract class ConfigurationBlocState {}

class ConfigurationInitialBlocState extends ConfigurationBlocState {
  ThemeData themeData;
  ConfigurationInitialBlocState({required this.themeData});
}
