import 'package:bloc/bloc.dart';
import 'package:news_app/features/news/presentation/bloc/theme_status.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc()
      : super(NewsState(
          themeStatus: DarkMode(isDarkMode: false),
        )) {
    on<IsDarkModeEvent>(_isDarkModeEvent);
  }

  void _isDarkModeEvent(IsDarkModeEvent event, Emitter<NewsState> emit) {
    DarkMode darkMode = state.themeStatus as DarkMode;

    if (darkMode.isDarkMode) {
      emit(state.copyWith(newThemeStatus: DarkMode(isDarkMode: false)));
    } else {
      emit(state.copyWith(newThemeStatus: DarkMode(isDarkMode: true)));
    }
  }
}
