import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Account/Domain/Entity/user_profile_details_entity.dart';
import 'package:needit_app/Features/Account/Domain/repos/create_user_from_firebase_repo.dart';
import 'package:needit_app/Features/services/firestore_service.dart';
import 'package:needit_app/core/error/failure.dart';
import 'package:needit_app/core/utlis/backend_endpoints.dart';

class CreateUserFromFirebaseRepoImpl implements CreateUserFromFirebaseRepo {
  final FirestorService firestorService;

  CreateUserFromFirebaseRepoImpl({required this.firestorService});
  @override
  Future<Either<Failure, void>> addUserdata({
    required UserProfileDetailsEntity userProfileDetailsEntity,
  }) async {
    try {
      await firestorService.addData(
        path: BackendEndpoints.addUserEndPoint,
        data: userProfileDetailsEntity.toMap(),
      );
      return right(unit);
    } catch (e) {
      log('error in createUserFromFirebaseRepoImpl of addUserdata is $e');
      return left(ServerFaliure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserProfileDetailsEntity>> getUserDataFromFirebase({
    required String userId,
  }) {
    // TODO: implement getUserDataFromFirebase
    throw UnimplementedError();
  }
}
