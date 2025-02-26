import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<MainEvent>(
      (event, emit) => switch (event) {
        MainEventChangeMenu _ => _onMainEventChangeMenu(event, emit),
      },
    );
  }

  void _onMainEventChangeMenu(MainEventChangeMenu event, Emitter<MainState> emit) {
    emit(state.copyWith(menu: event.menu));
  }
}
