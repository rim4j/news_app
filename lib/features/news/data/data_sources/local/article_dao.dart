import 'package:floor/floor.dart';
import 'package:news_app/features/news/data/models/article_model.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @Query('DELETE FROM article WHERE title = :title')
  Future<void> deleteArticle(String title);

  @Query("SELECT * FROM article")
  Future<List<ArticleModel>> getArticles();

  @Query('SELECT * FROM article WHERE title = :title')
  Future<ArticleModel?> findArticleByTitle(String title);
}
