import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Account/Data/repo/create_user_from_firebase_repo_impl.dart';
import 'package:needit_app/Features/Auth/Data/models/user_model.dart';
import 'package:needit_app/Features/Auth/Domain/Repos/auth_repo.dart';
import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';
import 'package:needit_app/Features/services/firbase_auth_service.dart';
import 'package:needit_app/core/error/custom_exception.dart';
import 'package:needit_app/core/error/failure.dart';

import '../../../Account/Domain/Entity/user_profile_details_entity.dart';

class AuthRepoImpl implements AuthRepo {
  final FirbaseAuthService firbaseAuthService;
  CreateUserFromFirebaseRepoImpl createUserFromFirebaseRepoImpl;
  AuthRepoImpl({
    required this.firbaseAuthService,
    required this.createUserFromFirebaseRepoImpl,
  });

  @override
  Future<Either<Failure, UserUntity>> creatUserWithEmailAndPasswort(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firbaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var resultUserUntity = UserModel.fromFireBaseUser(user);
      await createUserFromFirebaseRepoImpl.addUserdata(
        userProfileDetailsEntity: UserProfileDetailsEntity(
          userName: resultUserUntity.name,
          email: resultUserUntity.email,
          userId: resultUserUntity.uid,
        ),
      );

      return right(resultUserUntity);
    } on CustomException catch (e) {
      log('error in authrepoimpl of createUserWithEmailAndPassword is $e');
      return left(ServerFaliure(message: e.message));
    } catch (e) {
      log('error in authrepoimpl of createUserWithEmailAndPassword is $e');
      return left(ServerFaliure(message: 'An error occured try again'));
    }
  }
}
