import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class DeleteBookmarkArticleStatus extends Equatable {}

class DeleteBookmarkArticleStatusInitial extends DeleteBookmarkArticleStatus {
  @override
  List<Object?> get props => [];
}

class DeleteBookmarkArticleStatusLoading extends DeleteBookmarkArticleStatus {
  @override
  List<Object?> get props => [];
}

class DeleteBookmarkArticleStatusCompleted extends DeleteBookmarkArticleStatus {
  @override
  List<Object?> get props => [];
}

class DeleteBookmarkArticleStatusError extends DeleteBookmarkArticleStatus {
  @override
  List<Object?> get props => [];
}
