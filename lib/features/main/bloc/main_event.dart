part of 'main_bloc.dart';

@immutable
sealed class MainEvent {
  const MainEvent();
}

@immutable
class MainEventChangeMenu extends MainEvent {
  const MainEventChangeMenu(this.menu);

  final MainMenu menu;
}
