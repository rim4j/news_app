import 'package:dio/dio.dart';
import 'package:news_app/common/constants/constants.dart';

import 'package:news_app/features/news/data/data_sources/remote/article_remote_data_source.dart';

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {

  ArticleRemoteDataSourceImpl({
    required this.dio,
  });
  final Dio dio;

  @override
  Future<Response> getNewsArticles() async {
    final Response res = await dio.get(
      Constants.baseUrl,
      queryParameters: {
        'country': Constants.countryQuery,
        'category': Constants.categoryQuery,
        'apiKey': Constants.apiKey,
      },
    );

    return res;
  }
}
