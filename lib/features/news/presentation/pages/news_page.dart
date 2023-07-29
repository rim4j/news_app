import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:news_app/config/routes/route_name.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/features/news/domain/entities/article_entity.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/news_status.dart';
import 'package:news_app/features/news/presentation/bloc/theme_status.dart';
import 'package:news_app/features/news/presentation/widgets/article_card.dart';

class NewsPage extends HookWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;

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
        title: Text(
          'News App',
          style: fEncodeSansMedium,
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
              final DarkMode darkMode = newsState.themeStatus as DarkMode;
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
          ),
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
            ),
            onPressed: () =>
                Navigator.pushNamed(context, RouteNames.bookmarkPage),
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
            final NewsStatusCompleted newsStatusCompleted =
                newsState.newsStatus as NewsStatusCompleted;
            final List<ArticleEntity> articleList =
                newsStatusCompleted.articles;

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: articleList.length,
              itemBuilder: (context, index) {
                final article = articleList[index];
                return ArticleCard(
                  onTap: () => Navigator.pushNamed(
                    context,
                    RouteNames.singleNewsPage,
                    arguments: article,
                  ),
                  title: article.title!,
                  image: article.urlToImage!,
                  createdAt: article.publishedAt!,
                  author: article.author!,
                  screenSize: size,
                );
              },
            );
          }
          if (newsState.newsStatus is NewsStatusError) {
            return const Center(
              child: Text('error'),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
