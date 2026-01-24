import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Auth/Data/models/user_model.dart';
import 'package:needit_app/Features/Auth/Domain/Repos/auth_repo.dart';
import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';
import 'package:needit_app/Features/services/firbase_auth_service.dart';
import 'package:needit_app/core/error/custom_exception.dart';
import 'package:needit_app/core/error/failure.dart';

class AuthRepoImpl implements AuthRepo {
  final FirbaseAuthService firbaseAuthService;

  AuthRepoImpl({required this.firbaseAuthService});

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
      return right(UserModel.fromFireBaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFaliure(message: e.message));
    } catch (e) {
      return left(ServerFaliure(message: 'An error occured try again'));
    }
  }
}
