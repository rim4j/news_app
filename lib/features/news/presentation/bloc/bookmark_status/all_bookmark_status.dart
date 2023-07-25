import '../../../domain/entities/article_entity.dart';

abstract class AllBookmarkStatus {}

class AllBookmarkStatusLoading extends AllBookmarkStatus {}

class AllBookmarkStatusCompleted extends AllBookmarkStatus {
  List<ArticleEntity> bookmarkArticles;

  AllBookmarkStatusCompleted({
    required this.bookmarkArticles,
  });
}

class AllBookmarkStatusError extends AllBookmarkStatus {
  String error;
  AllBookmarkStatusError({
    required this.error,
  });
}
