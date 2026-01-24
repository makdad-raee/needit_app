import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';
import 'package:needit_app/core/error/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserUntity>> creatUserWithEmailAndPasswort(
    String email,
    String password,
    String name,
  );
}
