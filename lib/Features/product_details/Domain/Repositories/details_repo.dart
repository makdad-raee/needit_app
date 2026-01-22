import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/product_details/Domain/Entities/details_entity.dart';
import 'package:needit_app/core/error/failure.dart';

abstract class DetailsReposotory {
  Future<Either<Failure, DetailsEntity>> getDetailsOfProducts({
    required int id,
  });
}
