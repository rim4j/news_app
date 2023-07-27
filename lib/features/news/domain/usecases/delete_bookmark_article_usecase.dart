import 'package:news_app/common/usecase/use_case.dart';
import 'package:news_app/features/news/domain/repositories/article_repository.dart';

class DeleteBookmarkArticleUseCase implements UseCase<void, String> {
  DeleteBookmarkArticleUseCase({
    required this.articleRepository,
  });
  final ArticleRepository articleRepository;

  @override
  Future<void> call({String? params}) {
    return articleRepository.removeBookmarkArticle(params!);
  }
}
