import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/features/news/domain/entities/article_entity.dart';

@immutable
abstract class AllBookmarkStatus extends Equatable {}

class AllBookmarkStatusLoading extends AllBookmarkStatus {
  @override
  List<Object?> get props => [];
}

class AllBookmarkStatusCompleted extends AllBookmarkStatus {
  AllBookmarkStatusCompleted({
    required this.bookmarkArticles,
  });
  final List<ArticleEntity> bookmarkArticles;

  @override
  List<Object?> get props => [bookmarkArticles];
}

class AllBookmarkStatusError extends AllBookmarkStatus {
  AllBookmarkStatusError({
    required this.error,
  });
  final String error;

  @override
  List<Object?> get props => [error];
}
