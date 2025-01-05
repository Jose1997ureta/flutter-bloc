import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    bool darkMode = false,
  }) : super(ThemeState(isDark: darkMode));

  void toggleTheme() {
    emit(ThemeState(isDark: !state.isDark));
  }

  void setDarkMode() {
    emit(const ThemeState(isDark: true));
  }

  void setLightMode() {
    emit(const ThemeState(isDark: false));
  }
}
