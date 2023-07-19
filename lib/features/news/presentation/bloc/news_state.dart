part of 'news_bloc.dart';

class NewsState {
  ThemeStatus themeStatus;
  NewsStatus newsStatus;
  NewsState({
    required this.themeStatus,
    required this.newsStatus,
  });

  NewsState copyWith({
    ThemeStatus? newThemeStatus,
    NewsStatus? newNewsStatus,
  }) {
    return NewsState(
      themeStatus: newThemeStatus ?? themeStatus,
      newsStatus: newNewsStatus ?? newsStatus,
    );
  }
}
