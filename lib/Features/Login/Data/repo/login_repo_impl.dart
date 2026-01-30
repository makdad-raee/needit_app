import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Auth/Data/models/user_model.dart';
import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';
import 'package:needit_app/Features/Login/Domain/Repos/login_repo.dart';
import 'package:needit_app/Features/services/firbase_auth_service.dart';
import 'package:needit_app/core/error/custom_exception.dart';
import 'package:needit_app/core/error/failure.dart';

class LoginRepoImpl implements LoginRepo {
  final FirbaseAuthService firbaseAuthService;

  LoginRepoImpl({required this.firbaseAuthService});
  @override
  Future<Either<Failure, UserUntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var usercreditnal = await firbaseAuthService.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromUserCreditinal(usercreditnal));
    } on CustomException catch (e) {
      return left(ServerFaliure(message: e.toString()));
    } catch (e) {
      return left(ServerFaliure(message: e.toString()));
    }
  }
}
