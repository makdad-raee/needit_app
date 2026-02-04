abstract class AuthEvent {}

// الحدث الأهم: عند تشغيل التطبيق لفحص الحالة
class AppStarted extends AuthEvent {}

// حدث تسجيل الدخول
class LoginRequested extends AuthEvent {
  final String email;
  final String password;
  LoginRequested({required this.email, required this.password});
}

// حدث تسجيل الخروج
class LogoutRequested extends AuthEvent {}
