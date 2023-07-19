import 'package:news_app/common/resources/data_state.dart';
import 'package:news_app/features/news/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
