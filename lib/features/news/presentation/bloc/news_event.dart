part of 'news_bloc.dart';

abstract class NewsEvent {}

class IsDarkModeEvent extends NewsEvent {}

class GetArticlesEvent extends NewsEvent {}

class GetAllBookmarkArticlesEvent extends NewsEvent {}

class AddToBookmarkEvent extends NewsEvent {
  final ArticleEntity articleEntity;
  AddToBookmarkEvent({
    required this.articleEntity,
  });
}

class FindBookmarkArticleEvent extends NewsEvent {
  final String title;

  FindBookmarkArticleEvent({
    required this.title,
  });
}

class DeleteBookmarkArticleEvent extends NewsEvent {
  final String title;

  DeleteBookmarkArticleEvent({
    required this.title,
  });
}
