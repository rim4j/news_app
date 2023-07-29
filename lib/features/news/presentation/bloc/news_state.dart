part of 'news_bloc.dart';

class NewsState extends Equatable {
  const NewsState({
    required this.themeStatus,
    required this.newsStatus,
    required this.allBookmarkStatus,
    required this.addToBookmarkStatus,
    required this.findBookmarkArticleStatus,
    required this.deleteBookmarkArticleStatus,
  });
  final ThemeStatus themeStatus;
  final NewsStatus newsStatus;
  final AllBookmarkStatus allBookmarkStatus;
  final AddToBookmarkStatus addToBookmarkStatus;
  final FindBookmarkArticleStatus findBookmarkArticleStatus;
  final DeleteBookmarkArticleStatus deleteBookmarkArticleStatus;

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

  @override
  List<Object?> get props => [
        themeStatus,
        newsStatus,
        allBookmarkStatus,
        addToBookmarkStatus,
        findBookmarkArticleStatus,
        deleteBookmarkArticleStatus,
      ];
}
