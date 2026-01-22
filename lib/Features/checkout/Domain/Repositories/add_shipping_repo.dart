import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/checkout/Domain/entities/shipping_type_entity.dart';
import 'package:needit_app/core/error/failure.dart';

abstract class AddShippingRepo {
  Future<Either<Failure, void>> addShipping({
    required ShippingTypeEntity shippingentity,
  });
}
