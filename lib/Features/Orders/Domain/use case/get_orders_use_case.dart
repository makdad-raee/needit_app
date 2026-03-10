import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Orders/Domain/entity/order_entity.dart';
import 'package:needit_app/Features/Orders/Domain/repositories/order_repositories.dart';
import 'package:needit_app/core/error/failure.dart';

class GetOrdersUseCase {
  final OrderRepositories orderRepositories;

  GetOrdersUseCase({required this.orderRepositories});
  Future<Either<Failure, List<OrderEntity>>> call({
    required String userId,
  }) async {
    try {
      var order = await orderRepositories.getOrders(userId: userId);
      return Future.value(right(order));
    } catch (e) {
      return left(ServerFailure(message: 'serverFaliure'));
    }
  }
}
