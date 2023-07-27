import 'package:news_app/features/news/domain/entities/article_entity.dart';

abstract class AllBookmarkStatus {}

class AllBookmarkStatusLoading extends AllBookmarkStatus {}

class AllBookmarkStatusCompleted extends AllBookmarkStatus {

  AllBookmarkStatusCompleted({
    required this.bookmarkArticles,
  });
  List<ArticleEntity> bookmarkArticles;
}

class AllBookmarkStatusError extends AllBookmarkStatus {
  AllBookmarkStatusError({
    required this.error,
  });
  String error;
}
