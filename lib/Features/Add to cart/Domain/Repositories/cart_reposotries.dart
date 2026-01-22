import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_entity.dart';
import 'package:needit_app/core/error/failure.dart';

abstract class CartReposotries {
  Future<Either<Failure, List<CartEntity>>> getAllCart();
  Future<Unit> addToCart(CartEntity cartEntity);
  Future<Unit> removeFromCart(CartEntity cartEntity);
}
