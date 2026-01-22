import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_entity.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Repositories/cart_reposotries.dart';

class AddProductsToCartUsecase {
  final CartReposotries cartReposotries;
  AddProductsToCartUsecase({required this.cartReposotries});
  Future<Unit> call(CartEntity cartEntity) async {
    return cartReposotries.addToCart(cartEntity);
  }
}
