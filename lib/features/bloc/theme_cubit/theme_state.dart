part of 'theme_cubit.dart';

class ThemeState {
  final String theme;

  bool get isDark => theme == 'dark';
  bool get isLight => theme == 'light';

  const ThemeState({required this.theme});
}
