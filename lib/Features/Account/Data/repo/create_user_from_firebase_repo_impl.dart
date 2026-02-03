import 'dart:developer';

import 'package:needit_app/Features/Account/Domain/repos/create_user_from_firebase_repo.dart';
import 'package:needit_app/Features/Auth/Data/models/user_model.dart';
import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';
import 'package:needit_app/Features/services/firestore_service.dart';
import 'package:needit_app/core/utlis/backend_endpoints.dart';

class CreateUserFromFirebaseRepoImpl implements CreateUserFromFirebaseRepo {
  final FirestorService firestorService;

  CreateUserFromFirebaseRepoImpl({required this.firestorService});
  @override
  Future<void> addUserdata({required UserEntity userEntity}) async {
    try {
      await firestorService.addData(
        path: BackendEndpoints.addUserEndPoint,
        data: userEntity.toMap(),
        documentId: userEntity.uid,
      );
    } catch (e) {
      log('error in createUserFromFirebaseRepoImpl of addUserdata is $e');
    }
  }

  @override
  Future<UserEntity> getUserData({required String userId}) async {
    var userData = await firestorService.getData(
      documentId: userId,
      path: BackendEndpoints.addUserEndPoint,
    );
    log(' createUserFromFirebaseRepoImpl of getUserData is  $userData');
    return UserModel.fromMap(userData!);
  }
}
