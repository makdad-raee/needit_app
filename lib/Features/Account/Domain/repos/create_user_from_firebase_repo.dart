import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';

abstract class CreateUserFromFirebaseRepo {
  Future<void> addUserdata({required UserEntity userEntity});

  Future<UserEntity> getUserData({required String userId});
}
