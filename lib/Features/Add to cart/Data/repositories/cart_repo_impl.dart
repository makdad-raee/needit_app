import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Add%20to%20cart/Data/Local/cart_local_data_source.dart';
import 'package:needit_app/Features/Add%20to%20cart/Data/Remote/cart_remote_source.dart';
import 'package:needit_app/Features/Add%20to%20cart/Data/models/cart_item_model.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_entity.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_item_entity.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Repositories/cart_reposotries.dart';
import 'package:needit_app/Features/Orders/Data/models/order_model.dart';
import 'package:needit_app/core/error/excpetion.dart';
import 'package:needit_app/core/error/failure.dart';

class CartRepoImpl implements CartRepositories {
  final CartLocalDataSource cartLocalDataSource;
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepoImpl({
    required this.cartLocalDataSource,
    required this.cartRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<CartItemEntity>>> getCachedCart() async {
    try {
      final result = await cartLocalDataSource.getCachedCart();
      return Right(result); // الـ Model هو أصلاً Entity فيمكن تمريره
    } on EmptyCasheException {
      return Left(EmptyCasheFailure(message: 'No items in cart'));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> cacheCart(List<CartItemEntity> items) async {
    try {
      // تحويل القائمة من Entity إلى Model قبل الحفظ
      final models = items.map((e) => CartItemModel.fromEntity(e)).toList();
      await cartLocalDataSource.cacheCart(models);
      return const Right(unit);
    } catch (e) {
      return Left(EmptyCasheFailure(message: 'Failed to cache cart'));
    }
  }

  @override
  Future<Either<Failure, Unit>> checkout(OrderModel order) async {
    try {
      // إرسال الطلب لـ Firebase
      await cartRemoteDataSource.checkout(order: order);
      // بعد نجاح الطلب، يفضل مسح الكاش المحلي
      await cartLocalDataSource.cacheCart([]);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(message: 'Checkout failed: ${e.toString()}'));
    }
  }
}
