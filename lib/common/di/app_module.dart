import 'package:designs_hub/feature/dark_mode/data/repositories/theme_repository.dart';
import 'package:designs_hub/feature/dark_mode/domain/repositories/theme_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;

Future<void> appModuleSetup() async {
  var sharedPrefs = await SharedPreferences.getInstance();

  locator.registerLazySingleton<SharedPreferences>(
    () => sharedPrefs,
  );
  locator.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(sharedPrefs),
  );
}
