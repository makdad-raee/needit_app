import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_entity.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Repositories/cart_reposotries.dart';
import 'package:needit_app/core/error/failure.dart';

class GetAllCartUseCase {
  final CartReposotries cartReposotries;

  GetAllCartUseCase({required this.cartReposotries});
  Future<Either<Failure, List<CartEntity>>> call() async {
    return await cartReposotries.getAllCart();
  }
}
