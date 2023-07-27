import 'package:bloc/bloc.dart';
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
import 'package:news_app/features/news/presentation/bloc/news_status.dart';
import 'package:news_app/features/news/presentation/bloc/theme_status.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {

  NewsBloc({
    required this.getArticlesUseCase,
    required this.getBookmarkArticlesUseCase,
    required this.bookmarkArticleUseCase,
    required this.findBookmarkArticleUseCase,
    required this.deleteBookmarkArticleUseCase,
  }) : super(
          NewsState(
            themeStatus: DarkMode(isDarkMode: false),
            newsStatus: NewsStatusLoading(),
            allBookmarkStatus: AllBookmarkStatusLoading(),
            addToBookmarkStatus: AddToBookmarkStatusInitial(),
            findBookmarkArticleStatus: FindBookmarkArticleStatusLoading(),
            deleteBookmarkArticleStatus: DeleteBookmarkArticleStatusInitial(),
          ),
        ) {
    on<IsDarkModeEvent>(_isDarkModeEvent);
    on<GetArticlesEvent>(_isGetArticlesEvent);
    on<GetAllBookmarkArticlesEvent>(_isGetAllBookmarkArticlesEvent);
    on<AddToBookmarkEvent>(_isAddToBookmarkEvent);
    on<FindBookmarkArticleEvent>(_isFindBookmarkArticleEvent);
    on<DeleteBookmarkArticleEvent>(_isDeleteBookmarkArticleEvent);
  }
  final GetArticlesUseCase getArticlesUseCase;
  final GetBookmarkArticlesUseCase getBookmarkArticlesUseCase;
  final BookmarkArticleUseCase bookmarkArticleUseCase;
  final FindBookmarkArticleUseCase findBookmarkArticleUseCase;
  final DeleteBookmarkArticleUseCase deleteBookmarkArticleUseCase;

  void _isDarkModeEvent(IsDarkModeEvent event, Emitter<NewsState> emit) {
    final DarkMode darkMode = state.themeStatus as DarkMode;

    if (darkMode.isDarkMode) {
      emit(state.copyWith(newThemeStatus: DarkMode(isDarkMode: false)));
    } else {
      emit(state.copyWith(newThemeStatus: DarkMode(isDarkMode: true)));
    }
  }

  Future<void> _isGetArticlesEvent(
    GetArticlesEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(state.copyWith(newNewsStatus: NewsStatusLoading()));
    final DataState dataState = await getArticlesUseCase();

    if (dataState is DataSuccess) {
      emit(
        state.copyWith(
          newNewsStatus: NewsStatusCompleted(articles: dataState.data),
        ),
      );
    }

    if (dataState is DataFailed) {
      emit(
        state.copyWith(
          newNewsStatus: NewsStatusError(error: dataState.error!),
        ),
      );
    }
  }

  Future<void> _isGetAllBookmarkArticlesEvent(
    GetAllBookmarkArticlesEvent event,
    Emitter<NewsState> emit,
  ) async {
    final DataState dataState = await getBookmarkArticlesUseCase();

    if (dataState is DataSuccess) {
      emit(
        state.copyWith(
          newAllBookmarkStatus:
              AllBookmarkStatusCompleted(bookmarkArticles: dataState.data),
        ),
      );
    }

    if (dataState is DataFailed) {
      emit(
        state.copyWith(
          newAllBookmarkStatus: AllBookmarkStatusError(error: dataState.error!),
        ),
      );
    }
  }

  Future<void> _isAddToBookmarkEvent(
    AddToBookmarkEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(state.copyWith(newAddToBookmarkStatus: AddToBookmarkStatusLoading()));
    try {
      await bookmarkArticleUseCase(params: event.articleEntity);
      emit(
        state.copyWith(
          newAddToBookmarkStatus: AddToBookmarkStatusCompleted(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(newAddToBookmarkStatus: AddToBookmarkStatusError()));
    }
  }

  Future<void> _isFindBookmarkArticleEvent(
    FindBookmarkArticleEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(
      state.copyWith(
        newFindBookmarkArticleStatus: FindBookmarkArticleStatusLoading(),
      ),
    );
    final DataState dataState =
        await findBookmarkArticleUseCase(params: event.title);

    if (dataState is DataSuccess) {
      emit(
        state.copyWith(
          newFindBookmarkArticleStatus:
              FindBookmarkArticleStatusCompleted(isExist: dataState.data),
        ),
      );
    }

    if (dataState is DataFailed) {
      emit(
        state.copyWith(
          newFindBookmarkArticleStatus: FindBookmarkArticleStatusError(),
        ),
      );
    }
  }

  Future<void> _isDeleteBookmarkArticleEvent(
    DeleteBookmarkArticleEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(
      state.copyWith(
        newDeleteBookmarkArticleStatus: DeleteBookmarkArticleStatusLoading(),
      ),
    );

    try {
      await deleteBookmarkArticleUseCase(params: event.title);
      emit(
        state.copyWith(
          newDeleteBookmarkArticleStatus:
              DeleteBookmarkArticleStatusCompleted(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          newDeleteBookmarkArticleStatus: DeleteBookmarkArticleStatusError(),
        ),
      );
    }
  }
}
