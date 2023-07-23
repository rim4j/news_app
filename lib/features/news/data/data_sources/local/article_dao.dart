import 'package:floor/floor.dart';
import 'package:news_app/features/news/data/models/article_model.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @delete
  Future<void> deleteArticle(ArticleModel article);

  @Query("SELECT * FROM article")
  Future<List<ArticleModel>> getArticles();
}
