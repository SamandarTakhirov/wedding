import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/pages_status.dart';
import '../../../../core/utils/logger.dart';
import '../../data/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository}) : super(AuthState.initial()) {
    on<LoginSubmittedEvent>(_onLoginSubmittedEvent);
    on<ShowPasswordEvent>(_onShowPasswordEvent);
    on<GetUserInfoEvent>(_onGetUserInfoEvent);
  }

  final AuthService authRepository;

  Future<void> _onLoginSubmittedEvent(
    LoginSubmittedEvent event,
    Emitter<AuthState> emit,
  ) async {
    if (state.status.isLoading) return;
    emit(state.copyWith(status: Status.loading));

    final result = await authRepository.loginUser(
      login: event.login,
      password: event.password,
    );

    result.fold(
      (left) {
        info('Login error: ${left.message}');
        String? loginError;
        String? passwordError;
        if (left.message.contains('password is wrong')) {
          passwordError = 'Parolda xatolik';
        } else if (left.message.contains('Неверное имя пользователя')) {
          loginError = 'Loginda xatolik';
        } else {
          passwordError = 'Parolda xatolik';
        }
        emit(state.copyWith(
          status: Status.error,
          loginErrorText: loginError,
          passwordErrorText: passwordError,
        ));
      },
      (right) {
        final responseMap = right as Map<String, Object?>;
        final data = responseMap['data'];
        if (data != null && data is Map<String, Object?> && data['userFound'] == true) {
          final userId = data['userId'] as String? ?? '';
          if (userId.isNotEmpty) {
            add(GetUserInfoEvent(context: event.context, userId: userId));
          }
        } else {
          emit(state.copyWith(
            status: Status.error,
            loginErrorText: 'Foydalanuvchi topilmadi',
          ));
        }
      },
    );
  }

  void _onShowPasswordEvent(
    ShowPasswordEvent event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  Future<void> _onGetUserInfoEvent(
    GetUserInfoEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    // final result = await authRepository.getUserInfo(event.userId);
    // result.fold(
    //   (left) => emit(state.copyWith(status: Status.error)),
    //   (right) => emit(state.copyWith(status: Status.success)),
    // );
  }
}
