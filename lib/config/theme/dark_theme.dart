import 'package:flutter/material.dart';
import 'package:news_app/config/theme/app_colors.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: AppColorsDark.backGroundColor,
    primary: AppColorsDark.primaryColor,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColorsLight.primaryColor,
  ),
);
