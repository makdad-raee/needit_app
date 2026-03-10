import 'package:needit_app/Features/Orders/Domain/entity/order_entity.dart';

abstract class OrderRepositories {
  Future<List<OrderEntity>> getOrders({required String userId});
}
