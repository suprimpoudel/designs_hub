import 'package:designs_hub/feature/home/domain/use_cases/bottom_navigation_toggle_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationToggleUseCase, int> {
  BottomNavigationBloc() : super(0) {
    on<BottomNavigationToggleUseCase>((event, emit) {
      emit(event.index);
    });
  }
}
