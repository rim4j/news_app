import 'package:flutter/material.dart';
import 'package:news_app/config/routes/route_name.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/features/news/domain/entities/article_entity.dart';
import 'package:news_app/features/news/presentation/pages/bookmark_page.dart';
import 'package:news_app/features/news/presentation/pages/single_news_page.dart';

class OnGenerateRoute {
  OnGenerateRoute._();
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteNames.singleNewsPage:
        if (args is ArticleEntity) {
          return routeBuilder(SingleNewsPage(article: args));
        } else {
          return routeBuilder(const NoScreenFound());
        }
      case RouteNames.bookmarkPage:
        return routeBuilder(const BookmarkPage());

      default:
        return routeBuilder(const NoScreenFound());
    }
  }
}

MaterialPageRoute routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class NoScreenFound extends StatelessWidget {
  const NoScreenFound({super.key});
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: Text('screen not found!', style: fEncodeSansMedium),
      ),
      body: Center(
        child: Text(
          'screen not found!',
          style: fEncodeSansBold,
        ),
      ),
    );
  }
}
