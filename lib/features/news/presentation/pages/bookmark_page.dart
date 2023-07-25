import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:news_app/config/routes/route_name.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/features/news/domain/entities/article_entity.dart';
import 'package:news_app/features/news/presentation/bloc/bookmark_status/all_bookmark_status.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/widgets/article_card.dart';

class BookmarkPage extends HookWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;

    useEffect(
      () {
        BlocProvider.of<NewsBloc>(context).add(GetAllBookmarkArticlesEvent());
        return null;
      },
      [],
    );

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: Text(
          "bookmark",
          style: fEncodeSansMedium,
        ),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, newsState) {
          if (newsState.allBookmarkStatus is AllBookmarkStatusLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (newsState.allBookmarkStatus is AllBookmarkStatusCompleted) {
            final AllBookmarkStatusCompleted allBookmarkStatusCompleted =
                newsState.allBookmarkStatus as AllBookmarkStatusCompleted;

            final List<ArticleEntity> articleList =
                allBookmarkStatusCompleted.bookmarkArticles;

            if (articleList.isEmpty) {
              return Center(
                child: Text(
                  "bookmark is empty!",
                  style: fEncodeSansBold,
                ),
              );
            }

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
          if (newsState.allBookmarkStatus is AllBookmarkStatusError) {
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
