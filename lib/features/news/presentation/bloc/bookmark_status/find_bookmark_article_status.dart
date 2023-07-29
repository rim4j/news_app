import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class FindBookmarkArticleStatus extends Equatable {}

class FindBookmarkArticleStatusLoading extends FindBookmarkArticleStatus {
  @override
  List<Object?> get props => [];
}

class FindBookmarkArticleStatusCompleted extends FindBookmarkArticleStatus {
  FindBookmarkArticleStatusCompleted({
    required this.isExist,
  });
  final bool isExist;

  @override
  List<Object?> get props => [isExist];
}

class FindBookmarkArticleStatusError extends FindBookmarkArticleStatus {
  @override
  List<Object?> get props => [];
}
