import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:needit_app/Features/Account/Domain/repos/create_user_from_firebase_repo.dart';
import 'package:needit_app/Features/Auth/Data/models/user_model.dart';
import 'package:needit_app/Features/Auth/Domain/Repos/auth_repo.dart';
import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';
import 'package:needit_app/Features/services/firbase_auth_service.dart';
import 'package:needit_app/core/error/custom_exception.dart';
import 'package:needit_app/core/error/failure.dart';

class AuthRepoImpl implements AuthRepo {
  final FirbaseAuthService firbaseAuthService;
  CreateUserFromFirebaseRepo createUserFromFirebaseRepo;
  AuthRepoImpl({
    required this.firbaseAuthService,
    required this.createUserFromFirebaseRepo,
  });

  @override
  Future<Either<Failure, UserEntity>> creatUserWithEmailAndPasswort(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firbaseAuthService
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
            name: name,
          )
          .then((value) async {
            var resultUserUntity = UserEntity(
              name: name,
              uid: value.uid,
              email: email,
            );
            await createUserFromFirebaseRepo.addUserdata(
              userEntity: resultUserUntity,
            );
          })
          .catchError((e) {
            log(
              'error in authrepoimpl of createUserWithEmailAndPassword is $e',
            );
          });
      var resultUserUntity = UserModel.fromFireBaseUser(user!);

      return right(resultUserUntity);
    } on CustomException catch (e) {
      if (user != null) {
        await firbaseAuthService.deletUser();
      }
      log('error in authrepoimpl of createUserWithEmailAndPassword is $e');
      return left(ServerFaliure(message: e.message));
    } catch (e) {
      if (user != null) {
        await firbaseAuthService.deletUser();
      }
      log('error in authrepoimpl of createUserWithEmailAndPassword is $e');
      return left(ServerFaliure(message: 'An error occured try again '));
    }
  }
}
