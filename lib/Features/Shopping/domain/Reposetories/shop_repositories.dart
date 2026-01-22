import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/main_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/offer_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/popular_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/product_entity_category.dart';
import 'package:needit_app/core/error/failure.dart';

abstract class ShopRepository {
  Future<Either<Failure, List<OfferEntity>>> getAllOffers();
  Future<Either<Failure, List<PopularEntity>>> getAllPopular();
  Future<Either<Failure, List<MainEntity>>> getAllMain();
  Future<Either<Failure, List<ProductEntityCategory>>> getProductsOFGategory({
    required int id,
    required int limit,
  });
}
