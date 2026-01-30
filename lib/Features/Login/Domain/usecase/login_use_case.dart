import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';
import 'package:needit_app/Features/Login/Domain/Repos/login_repo.dart';
import 'package:needit_app/core/error/failure.dart';

class LoginWhithEmilAndpasswordUsecase {
  final LoginRepo loginRepo;

  LoginWhithEmilAndpasswordUsecase({required this.loginRepo});
  Future<Either<Failure, UserUntity>> call({
    required String email,
    required String password,
  }) async {
    return await loginRepo.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
