import 'package:news_app/features/news/domain/entities/article_entity.dart';

abstract class NewsStatus {}

class NewsStatusLoading extends NewsStatus {}

class NewsStatusCompleted extends NewsStatus {
  List<ArticleEntity> articles;

  NewsStatusCompleted({
    required this.articles,
  });
}

class NewsStatusError extends NewsStatus {
  String error;
  NewsStatusError({
    required this.error,
  });
}
