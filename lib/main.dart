import 'package:flutter/material.dart';
import 'package:news_app/config/theme/light_theme.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/pages/news_page.dart';
import 'package:news_app/locator.dart';

import 'config/theme/dark_theme.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/news/presentation/bloc/theme_status.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => locator<NewsBloc>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, newsState) {
        DarkMode darkMode = newsState.themeStatus as DarkMode;

        return MaterialApp(
          title: 'News app',
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            "/": (context) => const NewsPage(),
          },
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: darkMode.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}
