import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';
import 'package:needit_app/core/error/failure.dart';

abstract class CreateUserFromFirebaseRepo {
  Future<void> addUserdata({required UserEntity userEntity});

  Future<UserEntity> getUserData({required String userId});
}
