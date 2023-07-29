import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/common/resources/data_state.dart';
import 'package:news_app/features/news/domain/entities/article_entity.dart';
import 'package:news_app/features/news/domain/usecases/bookmark_article_usecase.dart';
import 'package:news_app/features/news/domain/usecases/delete_bookmark_article_usecase.dart';
import 'package:news_app/features/news/domain/usecases/find_bookmark_article_usecase.dart';
import 'package:news_app/features/news/domain/usecases/get_articles_usecase.dart';
import 'package:news_app/features/news/domain/usecases/get_bookmark_articles_usecase.dart';
import 'package:news_app/features/news/presentation/bloc/bookmark_status/add_to_bookmark_status.dart';
import 'package:news_app/features/news/presentation/bloc/bookmark_status/all_bookmark_status.dart';
import 'package:news_app/features/news/presentation/bloc/bookmark_status/delete_bookmark_status.dart';
import 'package:news_app/features/news/presentation/bloc/bookmark_status/find_bookmark_article_status.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/news_status.dart';
import 'package:news_app/features/news/presentation/bloc/theme_status.dart';

import 'news_bloc_test.mocks.dart';

@GenerateMocks([
  GetArticlesUseCase,
  GetBookmarkArticlesUseCase,
  BookmarkArticleUseCase,
  FindBookmarkArticleUseCase,
  DeleteBookmarkArticleUseCase
])
void main() {
  final MockGetArticlesUseCase mockGetArticlesUseCase =
      MockGetArticlesUseCase();

  final MockGetBookmarkArticlesUseCase mockGetBookmarkArticlesUseCase =
      MockGetBookmarkArticlesUseCase();

  final MockBookmarkArticleUseCase mockBookmarkArticleUseCase =
      MockBookmarkArticleUseCase();

  final MockFindBookmarkArticleUseCase mockFindBookmarkArticleUseCase =
      MockFindBookmarkArticleUseCase();

  final MockDeleteBookmarkArticleUseCase mockDeleteBookmarkArticleUseCase =
      MockDeleteBookmarkArticleUseCase();

  group(
    'get news loading and completed  GetArticlesUseCase test',
    () {
      const List<ArticleEntity> articles = [];
      when(mockGetArticlesUseCase.call())
          .thenAnswer((_) async => Future.value(const DataSuccess(articles)));

      blocTest<NewsBloc, NewsState>(
        'emits loading and completed state',
        build: () => NewsBloc(
          getArticlesUseCase: mockGetArticlesUseCase,
          bookmarkArticleUseCase: mockBookmarkArticleUseCase,
          deleteBookmarkArticleUseCase: mockDeleteBookmarkArticleUseCase,
          findBookmarkArticleUseCase: mockFindBookmarkArticleUseCase,
          getBookmarkArticlesUseCase: mockGetBookmarkArticlesUseCase,
        ),
        act: (bloc) {
          bloc.add(GetArticlesEvent());
        },
        expect: () => <NewsState>[
          NewsState(
            themeStatus: DarkMode(isDarkMode: false),
            newsStatus: NewsStatusLoading(),
            allBookmarkStatus: AllBookmarkStatusLoading(),
            addToBookmarkStatus: AddToBookmarkStatusInitial(),
            findBookmarkArticleStatus: FindBookmarkArticleStatusLoading(),
            deleteBookmarkArticleStatus: DeleteBookmarkArticleStatusInitial(),
          ),
          NewsState(
            themeStatus: DarkMode(isDarkMode: false),
            newsStatus: NewsStatusCompleted(articles: articles),
            allBookmarkStatus: AllBookmarkStatusLoading(),
            addToBookmarkStatus: AddToBookmarkStatusInitial(),
            findBookmarkArticleStatus: FindBookmarkArticleStatusLoading(),
            deleteBookmarkArticleStatus: DeleteBookmarkArticleStatusInitial(),
          ),
        ],
      );
    },
  );
  group(
    'get news loading and error GetArticlesUseCase test',
    () {
      const String error = 'error';
      when(mockGetArticlesUseCase.call())
          .thenAnswer((_) async => Future.value(const DataFailed(error)));
      blocTest<NewsBloc, NewsState>(
        'emits loading and error state',
        build: () => NewsBloc(
          getArticlesUseCase: mockGetArticlesUseCase,
          bookmarkArticleUseCase: mockBookmarkArticleUseCase,
          deleteBookmarkArticleUseCase: mockDeleteBookmarkArticleUseCase,
          findBookmarkArticleUseCase: mockFindBookmarkArticleUseCase,
          getBookmarkArticlesUseCase: mockGetBookmarkArticlesUseCase,
        ),
        act: (bloc) {
          bloc.add(GetArticlesEvent());
        },
        expect: () => <NewsState>[
          NewsState(
            themeStatus: DarkMode(isDarkMode: false),
            newsStatus: NewsStatusLoading(),
            allBookmarkStatus: AllBookmarkStatusLoading(),
            addToBookmarkStatus: AddToBookmarkStatusInitial(),
            findBookmarkArticleStatus: FindBookmarkArticleStatusLoading(),
            deleteBookmarkArticleStatus: DeleteBookmarkArticleStatusInitial(),
          ),
          NewsState(
            themeStatus: DarkMode(isDarkMode: false),
            newsStatus: NewsStatusError(error: error),
            allBookmarkStatus: AllBookmarkStatusLoading(),
            addToBookmarkStatus: AddToBookmarkStatusInitial(),
            findBookmarkArticleStatus: FindBookmarkArticleStatusLoading(),
            deleteBookmarkArticleStatus: DeleteBookmarkArticleStatusInitial(),
          ),
        ],
      );
    },
  );
}
