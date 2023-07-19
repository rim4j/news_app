import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/news_status.dart';
import 'package:news_app/features/news/presentation/bloc/theme_status.dart';

class NewsPage extends HookWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    useEffect(
      () {
        BlocProvider.of<NewsBloc>(context).add(GetArticlesEvent());
        return null;
      },
      [],
    );

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: const Text(
          'news app',
        ),
        actions: <Widget>[
          BlocBuilder<NewsBloc, NewsState>(
            buildWhen: (previous, current) {
              // rebuild just  themeStatus Changed
              if (previous.themeStatus == current.themeStatus) {
                return false;
              }
              return true;
            },
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
      body: BlocBuilder<NewsBloc, NewsState>(
        buildWhen: (previous, current) {
          // rebuild just  newsStatus Changed
          if (previous.newsStatus == current.newsStatus) {
            return false;
          }
          return true;
        },
        builder: (context, newsState) {
          if (newsState.newsStatus is NewsStatusLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (newsState.newsStatus is NewsStatusCompleted) {
            return const Center(
              child: Text("completed"),
            );
          }
          if (newsState.newsStatus is NewsStatusError) {
            return const Center(
              child: Text("error"),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
