import "package:blocs_app/config/config.dart";
import "package:get_it/get_it.dart";

import "blocs.dart";

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton(UsernameCubit());
  getIt.registerSingleton(RouterSimpleCubic());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(ThemeCubit());
  getIt.registerSingleton(GuestsBloc());
}
