import 'package:news_app/common/resources/data_state.dart';
import 'package:news_app/features/news/data/data_sources/local/app_database.dart';
import 'package:news_app/features/news/data/data_sources/remote/article_remote_data_source.dart';
import 'package:news_app/features/news/data/models/article_model.dart';
import 'package:news_app/features/news/domain/entities/article_entity.dart';
import 'package:news_app/features/news/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  ArticleRepositoryImpl({
    required this.articleRemoteDataSource,
    required this.appDataBase,
  });
  final ArticleRemoteDataSource articleRemoteDataSource;
  final AppDataBase appDataBase;
  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    try {
      final res = await articleRemoteDataSource.getNewsArticles();

      if (res.statusCode == 200) {
        final List<ArticleEntity> articleData = [];

        // ignore: avoid_dynamic_calls
        for (var item in res.data['articles']) {
          articleData.add(ArticleModel.fromJson(item));
        }

        return DataSuccess(articleData);
      } else {
        return const DataFailed('something went wrong please try again later');
      }
    } catch (e) {
      return const DataFailed('please check your connection');
    }
  }

  @override
  Future<void> bookmarkArticle(ArticleEntity articleEntity) async {
    return appDataBase.articleDAO
        .insertArticle(ArticleModel.fromEntity(articleEntity));
  }

  @override
  Future<DataState<List<ArticleEntity>>> getBookmarkArticles() async {
    try {
      final List<ArticleEntity> bookmarkArticles =
          await appDataBase.articleDAO.getArticles();

      return DataSuccess(bookmarkArticles);
    } catch (e) {
      return const DataFailed('something went wrong');
    }
  }

  @override
  Future<DataState<bool>> findArticleByTitle(String title) async {
    try {
      final ArticleEntity? articleEntity =
          await appDataBase.articleDAO.findArticleByTitle(title);

      if (articleEntity == null) {
        return const DataSuccess(false);
      } else {
        return const DataSuccess(true);
      }
    } catch (e) {
      return const DataFailed('something went wrong');
    }
  }

  @override
  Future<void> removeBookmarkArticle(String title) async {
    return appDataBase.articleDAO.deleteArticle(title);
  }
}
