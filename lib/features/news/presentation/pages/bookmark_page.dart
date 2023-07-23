import 'package:flutter/material.dart';
import 'package:news_app/config/theme/app_styles.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: Text(
          "bookmark",
          style: fEncodeSansMedium,
        ),
      ),
    );
  }
}
