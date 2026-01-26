part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class SignupWhithEmailAndPasswordEvent extends SignupEvent {
  final String email;
  final String password;
  final String name;
  SignupWhithEmailAndPasswordEvent({
    required this.email,
    required this.password,
    required this.name,
  });
}

class SignUpwithgoogleEvent extends SignupEvent {}

class SignUpwithappleEvent extends SignupEvent {}

class SignUpwithfacebookEvent extends SignupEvent {}

// class AllOrderEvent extends SignupEvent {}

// class PaidOrderEvent extends SignupEvent {}

// class DeliverdOrderEvent extends SignupEvent {}

// class CancelledOrderEvent extends SignupEvent {}
