import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class AddToBookmarkStatus extends Equatable {}

class AddToBookmarkStatusInitial extends AddToBookmarkStatus {
  @override
  List<Object?> get props => [];
}

class AddToBookmarkStatusLoading extends AddToBookmarkStatus {
  @override
  List<Object?> get props => [];
}

class AddToBookmarkStatusCompleted extends AddToBookmarkStatus {
  @override
  List<Object?> get props => [];
}

class AddToBookmarkStatusError extends AddToBookmarkStatus {
  @override
  List<Object?> get props => [];
}
