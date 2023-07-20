import 'package:dio/dio.dart';
import 'package:news_app/common/resources/data_state.dart';
import 'package:news_app/features/news/data/data_sources/remote/article_remote_data_source.dart';
import 'package:news_app/features/news/data/models/article_model.dart';
import 'package:news_app/features/news/domain/entities/article_entity.dart';
import 'package:news_app/features/news/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource articleRemoteDataSource;

  ArticleRepositoryImpl({
    required this.articleRemoteDataSource,
  });
  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    try {
      final Response res = await articleRemoteDataSource.getNewsArticles();

      if (res.statusCode == 200) {
        List<ArticleEntity> articleData = [];

        res.data["articles"]
            .forEach((item) => articleData.add(ArticleModel.fromJson(item)));

        return DataSuccess(articleData);
      } else {
        return const DataFailed("something went wrong please try again later");
      }
    } catch (e) {
      return const DataFailed("please check your connection");
    }
  }
}