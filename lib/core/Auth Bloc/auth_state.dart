import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {} // عند فتح التطبيق لأول مرة

class AuthLoading extends AuthState {} // أثناء انتظار العمليات

class AuthAuthenticated extends AuthState {
  final UserEntity user; // المستخدم مسجل دخول وبياناته موجودة
  AuthAuthenticated({required this.user});
}

class AuthUnauthenticated extends AuthState {} // المستخدم غير مسجل دخول

class AuthFailure extends AuthState {
  final String message;
  AuthFailure({required this.message});
}
