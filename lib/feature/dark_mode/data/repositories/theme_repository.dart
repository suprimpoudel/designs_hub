import 'package:designs_hub/feature/dark_mode/domain/repositories/theme_repository.dart';
import 'package:designs_hub/feature/dark_mode/utilities/theme_constants.dart';
import 'package:designs_hub/feature/dark_mode/utilities/theme_enums.dart';
import 'package:designs_hub/feature/dark_mode/utilities/theme_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final SharedPreferences preferences;

  ThemeRepositoryImpl(this.preferences);

  @override
  Future<AppTheme> toggleAppTheme() async {
    var currentTheme =
        getCurrentTheme(preferences.get(ThemeConstants.appTheme).toString());
    var themeToChange =
        currentTheme == AppTheme.light ? AppTheme.dark : AppTheme.light;
    return await preferences
        .setString(ThemeConstants.appTheme, themeToChange.name)
        .then((value) {
      return themeToChange;
    });
  }
}
