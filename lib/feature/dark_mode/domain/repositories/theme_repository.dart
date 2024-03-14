import 'package:designs_hub/feature/dark_mode/utilities/theme_enums.dart';

abstract class ThemeRepository {
  Future<AppTheme> toggleAppTheme();
}
