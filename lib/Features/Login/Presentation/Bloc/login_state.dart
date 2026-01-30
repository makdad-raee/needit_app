part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserUntity user;
  LoginSuccess({required this.user});
}

class Loginfailure extends LoginState {
  final String error;
  Loginfailure({required this.error});
}
