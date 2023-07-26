import 'package:flutter/material.dart';
import 'package:news_app/config/theme/app_styles.dart';

showSnack(context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: fEncodeSansMedium.copyWith(color: Colors.white),
    ),
    backgroundColor: color,
  ));
}
