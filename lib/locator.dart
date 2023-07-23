import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/news/data/data_sources/local/app_database.dart';
import 'package:news_app/features/news/data/data_sources/remote/article_remote_data_source.dart';
import 'package:news_app/features/news/data/data_sources/remote/article_remote_data_source_impl.dart';
import 'package:news_app/features/news/data/repositories/article_repository_impl.dart';
import 'package:news_app/features/news/domain/repositories/article_repository.dart';
import 'package:news_app/features/news/domain/usecases/bookmark_article_usecase.dart';
import 'package:news_app/features/news/domain/usecases/delete_article_usecase.dart';
import 'package:news_app/features/news/domain/usecases/get_articles_usecase.dart';
import 'package:news_app/features/news/domain/usecases/get_bookmark_articles_usecase.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';

GetIt locator = GetIt.instance;

Future<void> setup() async {
  final database =
      await $FloorAppDataBase.databaseBuilder("app_database.db").build();
  locator.registerSingleton<AppDataBase>(database);

  locator.registerSingleton<Dio>(Dio());
  //DATA SOURCES
  locator.registerSingleton<ArticleRemoteDataSource>(
      ArticleRemoteDataSourceImpl(dio: locator()));

  //REPOSITORIES
  locator.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(
      articleRemoteDataSource: locator(), appDataBase: locator()));

  //USE CASES
  locator.registerSingleton<GetArticlesUseCase>(
      GetArticlesUseCase(articleRepository: locator()));

  locator.registerSingleton<BookmarkArticleUseCase>(
      BookmarkArticleUseCase(articleRepository: locator()));

  locator.registerSingleton<DeleteArticleUseCase>(
      DeleteArticleUseCase(articleRepository: locator()));

  locator.registerSingleton<GetBookmarkArticlesUseCase>(
      GetBookmarkArticlesUseCase(articleRepository: locator()));

  //BLOCS

  locator.registerSingleton<NewsBloc>(NewsBloc(getArticlesUseCase: locator()));
}
