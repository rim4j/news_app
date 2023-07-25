abstract class FindBookmarkArticleStatus {}

class FindBookmarkArticleStatusLoading extends FindBookmarkArticleStatus {}

class FindBookmarkArticleStatusCompleted extends FindBookmarkArticleStatus {
  final bool isExist;

  FindBookmarkArticleStatusCompleted({
    required this.isExist,
  });
}

class FindBookmarkArticleStatusError extends FindBookmarkArticleStatus {}
