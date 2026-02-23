import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:needit_app/core/error/failure.dart';
import 'package:needit_app/core/get_products/Domain/entity/product_entity.dart';
import 'package:needit_app/core/get_products/Domain/repos/product_repo.dart';

class GetProductsUseCase {
  final ProductRepo productRepo;
  GetProductsUseCase({required this.productRepo});
  Future<Either<Failure, List<ProductEntity>>> call() async {
    try {
      final products = await productRepo.getProducts();
      log('Products retrieved successfully useCase: ${products.length} items');
      return Right(products);
    } catch (e) {
      log('Error retrieving products in useCase: $e');
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
