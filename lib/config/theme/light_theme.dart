import 'package:flutter/material.dart';
import 'package:news_app/config/theme/app_colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: AppColorsLight.backGroundColor,
    primary: AppColorsLight.primaryColor,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColorsLight.primaryColor,
  ),
);
