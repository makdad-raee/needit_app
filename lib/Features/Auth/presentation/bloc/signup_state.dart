part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final UserUntity user;
  SignupSuccess({required this.user});
}

class Signupfailure extends SignupState {
  final String error;
  Signupfailure({required this.error});
}
