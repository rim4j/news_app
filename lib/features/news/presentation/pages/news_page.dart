import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/theme_status.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: const Text(
          'news app',
        ),
        actions: <Widget>[
          BlocBuilder<NewsBloc, NewsState>(
            builder: (context, newsState) {
              DarkMode darkMode = newsState.themeStatus as DarkMode;
              return IconButton(
                icon: Icon(
                  darkMode.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: Colors.white,
                ),
                onPressed: () {
                  BlocProvider.of<NewsBloc>(context).add(IsDarkModeEvent());
                },
              );
            },
          )
        ],
      ),
    );
  }
}
