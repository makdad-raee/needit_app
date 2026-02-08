import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';

abstract class CreateUserFromFirebaseRepo {
  Future<void> addUserdata({required UserEntity user});

  Future<UserEntity> getUserData({required String userId});
  Future saveUserDataToLocal({required UserEntity user});
}
