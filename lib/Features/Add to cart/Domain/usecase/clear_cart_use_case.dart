import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Repositories/cart_reposotries.dart';
import 'package:needit_app/core/error/failure.dart';

class ClearCartUseCase {
  final CartRepositories repository;
  ClearCartUseCase({required this.repository});

  Future<Either<Failure, Unit>> call() async {
    return await repository.clearCart();
  }
}
