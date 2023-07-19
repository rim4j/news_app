import 'package:dio/dio.dart';
import 'package:news_app/common/constants/constants.dart';

import 'package:news_app/features/news/data/data_sources/remote/article_remote_data_source.dart';

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {
  final Dio dio;

  ArticleRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future getNewsArticles() async {
    Response res = await dio.get(Constants.baseUrl, queryParameters: {
      "country": Constants.countryQuery,
      "category": Constants.categoryQuery,
      "apiKey": Constants.apiKey,
    });

    return res;
  }
}
