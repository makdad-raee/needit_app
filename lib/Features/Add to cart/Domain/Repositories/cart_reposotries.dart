import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_item_entity.dart';
import 'package:needit_app/Features/Orders/Data/models/order_model.dart';
import 'package:needit_app/core/error/failure.dart';

abstract class CartRepositories {
  // جلب السلة من الكاش
  Future<Either<Failure, List<CartItemEntity>>> getCachedCart();

  // حفظ القائمة كاملة في الكاش بعد أي تعديل
  Future<Either<Failure, Unit>> cacheCart(List<CartItemEntity> items);

  // إرسال الطلب النهائي للسيرفر
  Future<Either<Failure, Unit>> checkout(OrderModel order);
}
