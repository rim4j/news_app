abstract class ThemeStatus {}

class DarkMode extends ThemeStatus {

  DarkMode({
    required this.isDarkMode,
  });
  bool isDarkMode;
}
