import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Orders/Data/repositories/order_repositories_impl.dart';
import 'package:needit_app/Features/Orders/Domain/entity/order_entity.dart';
import 'package:needit_app/core/error/failure.dart';

class GetOrdersUseCase {
  final OrderRepositoriesImpl orderRepositoriesImpl;

  GetOrdersUseCase({required this.orderRepositoriesImpl});
  Future<Either<Failure, List<OrderEntity>>> call() async {
    try {
      var order = await orderRepositoriesImpl.getOrders();
      return Future.value(right(order));
    } catch (e) {
      return left(ServerFaliure(message: 'serverFaliure'));
    }
  }
}
