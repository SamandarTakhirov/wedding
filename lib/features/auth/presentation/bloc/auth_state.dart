part of '../bloc/auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.loginErrorText,
    this.passwordErrorText,
    this.showPassword = false,
    this.status = Status.initial,
  });

  factory AuthState.initial() => const AuthState(
        loginErrorText: null,
        passwordErrorText: null,
        showPassword: false,
        status: Status.initial,
      );

  final String? loginErrorText;
  final String? passwordErrorText;
  final bool showPassword;
  final Status status;

  AuthState copyWith({
    String? loginErrorText,
    String? passwordErrorText,
    bool? showPassword,
    Status? status,
  }) =>
      AuthState(
        loginErrorText: loginErrorText ?? this.loginErrorText,
        passwordErrorText: passwordErrorText ?? this.passwordErrorText,
        showPassword: showPassword ?? this.showPassword,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [
        loginErrorText,
        passwordErrorText,
        showPassword,
        status,
      ];
}
