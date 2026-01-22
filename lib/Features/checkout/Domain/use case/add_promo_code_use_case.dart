import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/checkout/Domain/Repositories/add_promo_repo.dart';
import 'package:needit_app/Features/checkout/Domain/entities/promo_entity.dart';
import 'package:needit_app/core/error/failure.dart';

class AddPromoCodeUseCase {
  final AddPromoRepo addPromoCodeRepository;

  AddPromoCodeUseCase({required this.addPromoCodeRepository});
  Future<Either<Failure, void>> call({required PromoEntity PromoEntity}) {
    return addPromoCodeRepository.addPromo(promoEntity: PromoEntity);
  }
}
