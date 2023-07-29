import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/features/news/domain/entities/article_entity.dart';

@immutable
abstract class NewsStatus extends Equatable {}

class NewsStatusLoading extends NewsStatus {
  @override
  List<Object?> get props => [];
}

class NewsStatusCompleted extends NewsStatus {
  NewsStatusCompleted({
    required this.articles,
  });
  final List<ArticleEntity> articles;

  @override
  List<Object?> get props => [articles];
}

class NewsStatusError extends NewsStatus {
  NewsStatusError({
    required this.error,
  });
  final String error;

  @override
  List<Object?> get props => [error];
}
