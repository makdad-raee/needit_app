import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/checkout/Domain/entities/location_entity.dart';
import 'package:needit_app/core/error/failure.dart';

abstract class AddLocationRepo {
  Future<Either<Failure, void>> ddLocationRepo({
    required LocationEntity locationEntity,
  });
}
