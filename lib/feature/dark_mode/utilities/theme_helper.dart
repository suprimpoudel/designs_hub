import 'package:designs_hub/feature/dark_mode/utilities/theme_enums.dart';

AppTheme getCurrentTheme(String value) {
  return AppTheme.values.firstWhere(
    (element) => element.name == value,
    orElse: () => AppTheme.light,
  );
}
