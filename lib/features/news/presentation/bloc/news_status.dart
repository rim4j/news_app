import 'package:news_app/features/news/domain/entities/article_entity.dart';

abstract class NewsStatus {}

class NewsStatusLoading extends NewsStatus {}

class NewsStatusCompleted extends NewsStatus {

  NewsStatusCompleted({
    required this.articles,
  });
  List<ArticleEntity> articles;
}

class NewsStatusError extends NewsStatus {
  NewsStatusError({
    required this.error,
  });
  String error;
}
