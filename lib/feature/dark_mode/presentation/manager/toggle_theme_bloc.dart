import 'package:designs_hub/common/di/app_module.dart';
import 'package:designs_hub/feature/dark_mode/domain/repositories/theme_repository.dart';
import 'package:designs_hub/feature/dark_mode/domain/use_cases/toggle_theme_use_case.dart';
import 'package:designs_hub/feature/dark_mode/utilities/theme_enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleThemeBloc extends Bloc<ToggleThemeUseCase, AppTheme> {
  ToggleThemeBloc(super.appTheme) {
    var repository = locator.get<ThemeRepository>();

    on<ToggleThemeUseCase>((event, emit) async {
      await repository.toggleAppTheme().then((value) {
        emit(value);
      }).catchError((onError) {
        emit(state);
      });
    });
  }
}
