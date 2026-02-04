import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Account/Domain/repos/create_user_from_firebase_repo.dart';
import 'package:needit_app/Features/Auth/Domain/Repos/auth_repo.dart';
import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';
import 'package:needit_app/Features/Login/Domain/Repos/login_repo.dart';
import 'package:needit_app/Features/services/firbase_auth_service.dart';
import 'package:needit_app/core/Auth%20Bloc/auth_event.dart';
import 'package:needit_app/core/Auth%20Bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  final CreateUserFromFirebaseRepo createUserFromFirebaseRepo;
  final LoginRepo loginRepo;

  // متغير لحفظ بيانات المستخدم الحالية للوصول إليها بسهولة
  UserEntity? currentUser;

  AuthBloc({
    required this.authRepo,
    required this.createUserFromFirebaseRepo,
    required this.loginRepo,
  }) : super(AuthInitial()) {
    // 1. منطق فحص حالة المستخدم عند فتح التطبيق
    on<AppStarted>((event, emit) async {
      final bool loggedIn = FirbaseAuthService.isUserLoggedIn();

      if (loggedIn) {
        try {
          final uid = FirebaseAuth.instance.currentUser!.uid;

          // هنا الاستدعاء المباشر لأن التابع يرجع UserEntity وليس Either
          final user = await createUserFromFirebaseRepo.getUserData(
            userId: uid,
          );

          currentUser = user;
          emit(AuthAuthenticated(user: user));
        } catch (e) {
          log('Error fetching user data: $e');
          emit(AuthUnauthenticated());
        }
      } else {
        emit(AuthUnauthenticated());
      }
    });

    // 2. منطق تسجيل الدخول
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      final result = await loginRepo.loginWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      result.fold((failure) => emit(AuthFailure(message: failure.message)), (
        user,
      ) {
        currentUser = user;
        emit(AuthAuthenticated(user: user));
      });
    });

    // 3. منطق تسجيل الخروج
    on<LogoutRequested>((event, emit) async {
      await FirebaseAuth.instance.signOut();
      currentUser = null;
      emit(AuthUnauthenticated());
    });
  }
}
