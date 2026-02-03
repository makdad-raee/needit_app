import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';
import 'package:needit_app/core/error/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<UserEntity> getCurrentUserData({required String uid});
}
