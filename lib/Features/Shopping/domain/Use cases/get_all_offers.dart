import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/offer_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Reposetories/shop_repositories.dart';
import 'package:needit_app/core/error/failure.dart';

class GetAllOffersUseCase {
  final ShopRepository repository;

  GetAllOffersUseCase({required this.repository});
  Future<Either<Failure, List<OfferEntity>>> call() async {
    return await repository.getAllOffers();
  }
}
