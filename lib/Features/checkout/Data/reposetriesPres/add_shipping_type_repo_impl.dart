import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/checkout/Data/checkout_remote_data_source.dart';
import 'package:needit_app/Features/checkout/Domain/Repositories/add_shipping_repo.dart';
import 'package:needit_app/Features/checkout/Domain/entities/shipping_type_entity.dart';
import 'package:needit_app/core/error/failure.dart';

class AddShippingTypeRepoImpl implements AddShippingRepo {
  final CheckoutRemoteDataSource checkoutRemoteDataSource;

  AddShippingTypeRepoImpl({required this.checkoutRemoteDataSource});

  @override
  Future<Either<Failure, void>> addShipping({
    required ShippingTypeEntity shippingentity,
  }) {
    // TODO: implement addShipping
    throw UnimplementedError();
  }
}
