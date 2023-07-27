part of 'news_bloc.dart';

abstract class NewsEvent {}

class IsDarkModeEvent extends NewsEvent {}

class GetArticlesEvent extends NewsEvent {}

class GetAllBookmarkArticlesEvent extends NewsEvent {}

class AddToBookmarkEvent extends NewsEvent {
  AddToBookmarkEvent({
    required this.articleEntity,
  });
  final ArticleEntity articleEntity;
}

class FindBookmarkArticleEvent extends NewsEvent {

  FindBookmarkArticleEvent({
    required this.title,
  });
  final String title;
}

class DeleteBookmarkArticleEvent extends NewsEvent {

  DeleteBookmarkArticleEvent({
    required this.title,
  });
  final String title;
}
