import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Add%20to%20cart/Data/Local/cart_local_data_source.dart';
import 'package:needit_app/Features/Add%20to%20cart/Data/Remote/cart_remote_source.dart';
import 'package:needit_app/Features/Add%20to%20cart/Data/models/Cart_model.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_entity.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Repositories/cart_reposotries.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/error/excpetion.dart';
import 'package:needit_app/core/error/failure.dart';

class CartRepoImpl implements CartReposotries {
  final CartLocalDataSource cartLocalDataSource;
  final CartRemoteSource cartRemoteSource;

  CartRepoImpl({
    required this.cartLocalDataSource,
    required this.cartRemoteSource,
  });
  @override
  Future<Unit> addToCart(CartEntity cartEntity) async {
    await cartRemoteSource.addToCart(
      cartModels: [
        CartModel(
          name: cartEntity.name,
          totalPRice: cartEntity.totalPRice,
          quantity: cartEntity.quantity,
          color: cartEntity.color,
          size: cartEntity.size,
          imageUrl: cartEntity.imageUrl,
          id: cartEntity.id,
          priceOnePiesce: cartEntity.priceOnePiesce,
        ),
      ],
    );
    kTotalPrice = kTotalPrice + cartEntity.totalPRice;
    return Future.value(unit);
  }

  @override
  Future<Either<Failure, List<CartEntity>>> getAllCart() async {
    try {
      final result = await cartLocalDataSource.getAllCart();
      return right(result);
    } on EmptyCasheException {
      return left(EmptyCasheFailure());
    }
  }

  @override
  Future<Unit> removeFromCart(CartEntity cartEntity) {
    kTotalPrice -= cartEntity.totalPRice;
    cartRemoteSource.removeFromCart(
      cartModels: [
        CartModel(
          name: cartEntity.name,
          totalPRice: cartEntity.totalPRice,
          quantity: cartEntity.quantity,
          color: cartEntity.color,
          size: cartEntity.size,
          imageUrl: cartEntity.imageUrl,
          id: cartEntity.id,
          priceOnePiesce: cartEntity.priceOnePiesce,
        ),
      ],
    );

    return Future.value(unit);
  }
}
