import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/checkout/Data/checkout_remote_data_source.dart';
import 'package:needit_app/Features/checkout/Domain/Repositories/add_location_repo.dart';
import 'package:needit_app/Features/checkout/Domain/entities/location_entity.dart';
import 'package:needit_app/Features/checkout/Presentation/models/location_models.dart';
import 'package:needit_app/core/error/failure.dart';

class AddLocationRepoImpl implements AddLocationRepo {
  final CheckoutRemoteDataSource checkoutRemoteDataSource;

  AddLocationRepoImpl({required this.checkoutRemoteDataSource});

  @override
  Future<Either<Failure, void>> ddLocationRepo({
    required LocationEntity locationEntity,
  }) async {
    try {
      await checkoutRemoteDataSource.addlocation(
        locationModel: LocationModels(
          logo: locationEntity.logo,
          name: locationEntity.name,
          details: locationEntity.details,
        ),
      );
      return Future.value(right(unit));
    } on Exception {
      return Future.value(left(ServerFaliure(message: 'ServerFaliure')));
    }
  }
}
