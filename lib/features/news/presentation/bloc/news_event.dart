part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {}

class IsDarkModeEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}

class GetArticlesEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}

class GetAllBookmarkArticlesEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}

class AddToBookmarkEvent extends NewsEvent {
  AddToBookmarkEvent({
    required this.articleEntity,
  });
  final ArticleEntity articleEntity;

  @override
  List<Object?> get props => [articleEntity];
}

class FindBookmarkArticleEvent extends NewsEvent {
  FindBookmarkArticleEvent({
    required this.title,
  });
  final String title;

  @override
  List<Object?> get props => [title];
}

class DeleteBookmarkArticleEvent extends NewsEvent {
  DeleteBookmarkArticleEvent({
    required this.title,
  });
  final String title;

  @override
  List<Object?> get props => [title];
}
