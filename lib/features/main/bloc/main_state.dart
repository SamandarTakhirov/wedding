part of 'main_bloc.dart';

enum MainMenu { dashboard, invitetation, sales }

@immutable
class MainState extends Equatable {
  const MainState({
    this.menu = MainMenu.dashboard,
  });

  final MainMenu menu;

  MainState copyWith({
    MainMenu? menu,
  }) =>
      MainState(
        menu: menu ?? this.menu,
      );

  @override
  List<Object?> get props => [menu];
}
