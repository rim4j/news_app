part of 'news_bloc.dart';

class NewsState {
  ThemeStatus themeStatus;
  NewsState({
    required this.themeStatus,
  });

  NewsState copyWith({ThemeStatus? newThemeStatus}) {
    return NewsState(
      themeStatus: newThemeStatus ?? themeStatus,
    );
  }
}
