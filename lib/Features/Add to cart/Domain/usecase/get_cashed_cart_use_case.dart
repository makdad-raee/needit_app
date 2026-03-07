import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_item_entity.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Repositories/cart_reposotries.dart';
import 'package:needit_app/core/error/failure.dart';

class GetCachedCartUseCase {
  final CartRepositories cartReposotries;

  GetCachedCartUseCase({required this.cartReposotries});
  Future<Either<Failure, List<CartItemEntity>>> call() async {
    return await cartReposotries.getCachedCart();
  }
}
