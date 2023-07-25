import 'package:news_app/common/resources/data_state.dart';
import 'package:news_app/common/usecase/use_case.dart';
import 'package:news_app/features/news/domain/entities/article_entity.dart';
import 'package:news_app/features/news/domain/repositories/article_repository.dart';

class GetBookmarkArticlesUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository articleRepository;
  GetBookmarkArticlesUseCase({
    required this.articleRepository,
  });

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return articleRepository.getBookmarkArticles();
  }
}
