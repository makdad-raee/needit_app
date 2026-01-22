import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/checkout/Domain/Repositories/add_shipping_repo.dart';
import 'package:needit_app/Features/checkout/Domain/entities/shipping_type_entity.dart';
import 'package:needit_app/core/error/failure.dart';

class AddShippingTypeUseCase {
  final AddShippingRepo addShippingRepo;

  AddShippingTypeUseCase({required this.addShippingRepo});
  Future<Either<Failure, void>> call({
    required ShippingTypeEntity shippingTypeEntity,
  }) {
    return addShippingRepo.addShipping(shippingentity: shippingTypeEntity);
  }
}
