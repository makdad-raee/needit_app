part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccessAndGetUserData extends LoginState {
  final UserEntity user;
  LoginSuccessAndGetUserData({required this.user});
}

class Loginfailure extends LoginState {
  final String error;
  Loginfailure({required this.error});
}
// class GetCurrentUserDataSuccess extends LoginState {
//   final UserEntity user;
//   GetCurrentUserDataSuccess({required this.user});
// }