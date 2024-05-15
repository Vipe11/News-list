import 'package:bloc/bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(theme: 'system'));

  void setTheme(String theme) {
    emit(ThemeState(theme: theme));
  }
}
