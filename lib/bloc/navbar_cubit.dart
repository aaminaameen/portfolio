import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navbar_state.dart';

class MainMenuCubit extends Cubit<MainMenuState> {
  MainMenuCubit() : super(MainMenuSelectdState());
  int _currentMenuIndex = 0;
  void onSelectedMenu(int index) {
    _currentMenuIndex = index;
    emit(MainMenuSelectdState(index));
  }

  void onHoverMenu({required bool value, required int hoveredIndex}) {
    if (value) {
      emit(MainMenuSelectdState(hoveredIndex));
    } else {
      emit(MainMenuSelectdState(_currentMenuIndex));
    }
  }
}
