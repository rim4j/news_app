part of 'news_bloc.dart';

class NewsState {

  NewsState({
    required this.themeStatus,
    required this.newsStatus,
    required this.allBookmarkStatus,
    required this.addToBookmarkStatus,
    required this.findBookmarkArticleStatus,
    required this.deleteBookmarkArticleStatus,
  });
  ThemeStatus themeStatus;
  NewsStatus newsStatus;
  AllBookmarkStatus allBookmarkStatus;
  AddToBookmarkStatus addToBookmarkStatus;
  FindBookmarkArticleStatus findBookmarkArticleStatus;
  DeleteBookmarkArticleStatus deleteBookmarkArticleStatus;

  NewsState copyWith({
    ThemeStatus? newThemeStatus,
    NewsStatus? newNewsStatus,
    AllBookmarkStatus? newAllBookmarkStatus,
    AddToBookmarkStatus? newAddToBookmarkStatus,
    FindBookmarkArticleStatus? newFindBookmarkArticleStatus,
    DeleteBookmarkArticleStatus? newDeleteBookmarkArticleStatus,
  }) {
    return NewsState(
      themeStatus: newThemeStatus ?? themeStatus,
      newsStatus: newNewsStatus ?? newsStatus,
      allBookmarkStatus: newAllBookmarkStatus ?? allBookmarkStatus,
      addToBookmarkStatus: newAddToBookmarkStatus ?? addToBookmarkStatus,
      findBookmarkArticleStatus:
          newFindBookmarkArticleStatus ?? findBookmarkArticleStatus,
      deleteBookmarkArticleStatus:
          newDeleteBookmarkArticleStatus ?? deleteBookmarkArticleStatus,
    );
  }
}
