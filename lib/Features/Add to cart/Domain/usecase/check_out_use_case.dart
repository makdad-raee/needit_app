import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Repositories/cart_reposotries.dart';
import 'package:needit_app/Features/Orders/Data/models/order_model.dart';
import 'package:needit_app/core/error/failure.dart';

class CheckoutUseCase {
  final CartRepositories cartRepositories;
  CheckoutUseCase({required this.cartRepositories});

  Future<Either<Failure, Unit>> call(OrderModel order) async {
    return await cartRepositories.checkout(order);
  }
}
