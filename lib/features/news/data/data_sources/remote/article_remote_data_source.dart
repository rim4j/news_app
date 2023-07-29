import 'package:dio/dio.dart';

abstract class ArticleRemoteDataSource {
  Future<Response> getNewsArticles();
}
