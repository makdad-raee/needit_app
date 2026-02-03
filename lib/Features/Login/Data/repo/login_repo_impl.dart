import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Account/Domain/repos/create_user_from_firebase_repo.dart';
import 'package:needit_app/Features/Auth/Data/models/user_model.dart';
import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';
import 'package:needit_app/Features/Login/Domain/Repos/login_repo.dart';
import 'package:needit_app/Features/services/firbase_auth_service.dart';
import 'package:needit_app/core/error/custom_exception.dart';
import 'package:needit_app/core/error/failure.dart';

class LoginRepoImpl implements LoginRepo {
  final FirbaseAuthService firbaseAuthService;
  final CreateUserFromFirebaseRepo createUserFromFirebaseRepo;

  LoginRepoImpl(
    this.createUserFromFirebaseRepo, {
    required this.firbaseAuthService,
  });
  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserEntity userEntity;
    try {
      var usercreditnal = await firbaseAuthService.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      userEntity = await getCurrentUserData(uid: usercreditnal.user!.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      log(
        'error in CustomException loginrepoimpl of loginWithEmailAndPassword is $e',
      );
      return left(ServerFaliure(message: e.toString()));
    } catch (e) {
      log('error in loginrepoimpl of loginWithEmailAndPassword is $e');
      return left(ServerFaliure(message: e.toString()));
    }
  }

  @override
  Future<UserEntity> getCurrentUserData({required String uid}) async {
    return createUserFromFirebaseRepo.getUserData(userId: uid);
  }
}
