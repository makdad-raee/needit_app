import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Orders/Domain/entity/order_entity.dart';

abstract class OrderRepositories {
  Future<List<OrderEntity>> getOrders();
  Future<Unit> addOrder({required OrderEntity orderEntity});
  Future<Unit> removeOrder({required OrderEntity orderEntity});
}
