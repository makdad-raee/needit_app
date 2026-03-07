import 'package:needit_app/Features/Orders/Data/models/order_model.dart';

abstract class CheckoutRepository {
  Future<void> placeOrder(OrderModel order);
  Future<List<OrderModel>> getMyOrders(
    String userId,
  ); // لزوم صفحة My Orders اللي بالفيجما
}
