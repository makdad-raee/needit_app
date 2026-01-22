import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/checkout/Domain/Repositories/add_location_repo.dart';
import 'package:needit_app/Features/checkout/Domain/entities/location_entity.dart';
import 'package:needit_app/core/error/failure.dart';

class AddLocationUseCase {
  final AddLocationRepo addShippingRepo;
  AddLocationUseCase({required this.addShippingRepo});
  Future<Either<Failure, void>> call({
    required LocationEntity shippingentity,
  }) async {
    return await addShippingRepo.ddLocationRepo(locationEntity: shippingentity);
  }
}
