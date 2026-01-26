import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Auth/Domain/Repos/auth_repo.dart';
import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';
import 'package:needit_app/core/error/failure.dart';

class SignupUpWhithEmilAndpasswordUsecase {
  final AuthRepo authRepo;
  SignupUpWhithEmilAndpasswordUsecase({required this.authRepo});
  Future<Either<Failure, UserUntity>> call({
    required String email,
    required String password,
    required name,
  }) async {
    return await authRepo.creatUserWithEmailAndPasswort(email, password, name);
  }
}
