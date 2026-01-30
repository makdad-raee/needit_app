part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginWhithEmailAndPasswordEvent extends LoginEvent {
  final String email;
  final String password;

  LoginWhithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });
}

class LoginwithgoogleEvent extends LoginEvent {}

class LoginwithappleEvent extends LoginEvent {}

class LoginwithfacebookEvent extends LoginEvent {}

// class AllOrderEvent extends SignupEvent {}

// class PaidOrderEvent extends SignupEvent {}

// class DeliverdOrderEvent extends SignupEvent {}

// class CancelledOrderEvent extends SignupEvent {}
