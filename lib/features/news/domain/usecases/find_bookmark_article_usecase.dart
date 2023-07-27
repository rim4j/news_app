import 'package:news_app/common/resources/data_state.dart';
import 'package:news_app/common/usecase/use_case.dart';
import 'package:news_app/features/news/domain/repositories/article_repository.dart';

class FindBookmarkArticleUseCase implements UseCase<DataState<bool>, String> {
  FindBookmarkArticleUseCase({
    required this.articleRepository,
  });
  final ArticleRepository articleRepository;
  @override
  Future<DataState<bool>> call({String? params}) {
    return articleRepository.findArticleByTitle(params!);
  }
}
