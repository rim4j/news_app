import 'package:bloc/bloc.dart';
import 'package:news_app/common/resources/data_state.dart';
import 'package:news_app/features/news/domain/usecases/get_articles_usecase.dart';
import 'package:news_app/features/news/presentation/bloc/news_status.dart';
import 'package:news_app/features/news/presentation/bloc/theme_status.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetArticlesUseCase getArticlesUseCase;
  NewsBloc({
    required this.getArticlesUseCase,
  }) : super(NewsState(
          themeStatus: DarkMode(isDarkMode: false),
          newsStatus: NewsStatusLoading(),
        )) {
    on<IsDarkModeEvent>(_isDarkModeEvent);
    on<GetArticlesEvent>(_isGetArticlesEvent);
  }

  void _isDarkModeEvent(IsDarkModeEvent event, Emitter<NewsState> emit) {
    DarkMode darkMode = state.themeStatus as DarkMode;

    if (darkMode.isDarkMode) {
      emit(state.copyWith(newThemeStatus: DarkMode(isDarkMode: false)));
    } else {
      emit(state.copyWith(newThemeStatus: DarkMode(isDarkMode: true)));
    }
  }

  void _isGetArticlesEvent(
      GetArticlesEvent event, Emitter<NewsState> emit) async {
    emit(state.copyWith(newNewsStatus: NewsStatusLoading()));
    final DataState dataState = await getArticlesUseCase();

    if (dataState is DataSuccess) {
      emit(state.copyWith(
          newNewsStatus: NewsStatusCompleted(articles: dataState.data)));
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(
          newNewsStatus: NewsStatusError(error: dataState.error!)));
    }
  }
}
