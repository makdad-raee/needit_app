import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Orders/Domain/entity/order_entity.dart';
import 'package:needit_app/Features/Orders/Domain/repositories/order_repositories.dart';

class OrderRepositoriesImpl implements OrderRepositories {
  @override
  Future<Unit> addOrder({required OrderEntity orderEntity}) {
    // TODO: implement addOrder
    throw UnimplementedError();
  }

  @override
  Future<List<OrderEntity>> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }

  @override
  Future<Unit> removeOrder({required OrderEntity orderEntity}) {
    // TODO: implement removeOrder
    throw UnimplementedError();
  }
}
