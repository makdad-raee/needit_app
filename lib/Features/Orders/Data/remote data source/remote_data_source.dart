import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Orders/Data/models/order_model.dart';

abstract class RemoteDataSource {
  Future<Unit> addOrder({required OrderModel orderModel});
  Future<List<OrderModel>> getOrder();
  Future<Unit> removeOrder({required OrderModel orderModel});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<Unit> addOrder({required OrderModel orderModel}) {
    // TODO: implement addOrder
    throw UnimplementedError();
  }

  @override
  Future<List<OrderModel>> getOrder() {
    // TODO: implement getOrder
    throw UnimplementedError();
  }

  @override
  Future<Unit> removeOrder({required OrderModel orderModel}) {
    // TODO: implement removeOrder
    throw UnimplementedError();
  }
}
