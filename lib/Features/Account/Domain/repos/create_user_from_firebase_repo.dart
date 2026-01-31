import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Account/Domain/Entity/user_profile_details_entity.dart';
import 'package:needit_app/core/error/failure.dart';

abstract class CreateUserFromFirebaseRepo {
  Future<Either<Failure, void>> addUserdata({
    required UserProfileDetailsEntity userProfileDetailsEntity,
  });
  Future<Either<Failure, UserProfileDetailsEntity>> getUserDataFromFirebase({
    required String userId,
  });
}
