import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/checkout/Domain/entities/promo_entity.dart';
import 'package:needit_app/core/error/failure.dart';

abstract class AddPromoRepo {
  Future<Either<Failure, void>> addPromo({required PromoEntity promoEntity});
}
