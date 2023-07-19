part of 'news_bloc.dart';

abstract class NewsEvent {}

class IsDarkModeEvent extends NewsEvent {}

class GetArticlesEvent extends NewsEvent {}
