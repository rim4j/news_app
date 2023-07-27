abstract class FindBookmarkArticleStatus {}

class FindBookmarkArticleStatusLoading extends FindBookmarkArticleStatus {}

class FindBookmarkArticleStatusCompleted extends FindBookmarkArticleStatus {

  FindBookmarkArticleStatusCompleted({
    required this.isExist,
  });
  final bool isExist;
}

class FindBookmarkArticleStatusError extends FindBookmarkArticleStatus {}
