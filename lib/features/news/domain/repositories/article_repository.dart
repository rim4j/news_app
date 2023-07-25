import 'package:news_app/common/resources/data_state.dart';
import 'package:news_app/features/news/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  Future<DataState<List<ArticleEntity>>> getBookmarkArticles();
  Future<void> bookmarkArticle(ArticleEntity articleEntity);
  Future<void> removeBookmarkArticle(String title);
  Future<DataState<bool>> findArticleByTitle(String title);
}
