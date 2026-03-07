import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_item_entity.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Repositories/cart_reposotries.dart';
import 'package:needit_app/core/error/failure.dart';

class CacheCartUseCase {
  final CartRepositories cartRepositories;

  CacheCartUseCase({required this.cartRepositories});

  // نمرر قائمة العناصر بالكامل ليتم حفظها
  Future<Either<Failure, Unit>> call(List<CartItemEntity> items) async {
    return await cartRepositories.cacheCart(items);
  }
}
