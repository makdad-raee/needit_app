import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/checkout/Data/checkout_remote_data_source.dart';
import 'package:needit_app/Features/checkout/Domain/Repositories/add_promo_repo.dart';
import 'package:needit_app/Features/checkout/Domain/entities/promo_entity.dart';
import 'package:needit_app/Features/checkout/Presentation/models/promo_models.dart';
import 'package:needit_app/core/error/failure.dart';

class AddPromoRepoImpl implements AddPromoRepo {
  final CheckoutRemoteDataSource checkoutRemoteDataSource;

  AddPromoRepoImpl({required this.checkoutRemoteDataSource});
  @override
  Future<Either<Failure, void>> addPromo({
    required PromoEntity promoEntity,
  }) async {
    try {
      await checkoutRemoteDataSource.addPromo(
        PromoModels: PromoModels(
          logo: promoEntity.logo,
          name: promoEntity.name,
          details: promoEntity.details,
        ),
      );
      return Future.value(right(unit));
    } catch (e) {
      return Future.value(left(ServerFaliure(message: 'ServerFaliure')));
    }
  }
}
