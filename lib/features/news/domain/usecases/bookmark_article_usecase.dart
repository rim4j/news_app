import 'package:news_app/common/usecase/use_case.dart';
import 'package:news_app/features/news/domain/entities/article_entity.dart';
import 'package:news_app/features/news/domain/repositories/article_repository.dart';

class BookmarkArticleUseCase implements UseCase<void, ArticleEntity> {
  BookmarkArticleUseCase({
    required this.articleRepository,
  });
  final ArticleRepository articleRepository;
  @override
  Future<dynamic> call({ArticleEntity? params}) {
    return articleRepository.bookmarkArticle(params!);
  }
}
