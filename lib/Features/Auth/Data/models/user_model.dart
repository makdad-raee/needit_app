import 'package:firebase_auth/firebase_auth.dart';
import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.uid, required super.email});
  factory UserModel.fromFireBaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      uid: user.uid,
      email: user.email ?? '',
    );
  }
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
    );
  }
}
