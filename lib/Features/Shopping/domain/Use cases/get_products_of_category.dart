import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/product_entity_category.dart';
import 'package:needit_app/Features/Shopping/domain/Reposetories/shop_repositories.dart';
import 'package:needit_app/core/error/failure.dart';

class GetProductsOfCategoryUseCase {
  final ShopRepository repository;

  GetProductsOfCategoryUseCase({required this.repository});

  Future<Either<Failure, List<ProductEntityCategory>>> call({
    required int id,
    required int limit,
  }) async {
    return await repository.getProductsOFGategory(id: id, limit: limit);
  }
}
