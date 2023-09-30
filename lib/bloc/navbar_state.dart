part of 'navbar_cubit.dart';

@immutable
class MainMenuState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MainMenuSelectdState extends MainMenuState {
  final int index;
  MainMenuSelectdState([this.index = 0]);

  @override
  List<Object?> get props => [index];
}
