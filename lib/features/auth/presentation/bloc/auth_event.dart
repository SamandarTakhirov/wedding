part of '../bloc/auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class LoginSubmittedEvent extends AuthEvent {
  const LoginSubmittedEvent({
    required this.login,
    required this.password,
    required this.context,
  });
  final String login;
  final String password;
  final BuildContext context;
  @override
  List<Object?> get props => [login, password, context];
}

class ShowPasswordEvent extends AuthEvent {
  const ShowPasswordEvent();
  @override
  List<Object?> get props => [];
}

class GetUserInfoEvent extends AuthEvent {
  const GetUserInfoEvent({
    required this.userId,
    required this.context,
  });
  final String userId;
  final BuildContext context;
  @override
  List<Object?> get props => [userId, context];
}
