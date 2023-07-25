import 'package:news_app/common/usecase/use_case.dart';
import 'package:news_app/features/news/domain/repositories/article_repository.dart';

class DeleteBookmarkArticleUseCase implements UseCase<void, String> {
  final ArticleRepository articleRepository;
  DeleteBookmarkArticleUseCase({
    required this.articleRepository,
  });

  @override
  Future<void> call({String? params}) {
    return articleRepository.removeBookmarkArticle(params!);
  }
}
