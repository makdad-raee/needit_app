import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Orders/Data/repositories/order_repositories_impl.dart';
import 'package:needit_app/Features/Orders/Domain/entity/order_entity.dart';
import 'package:needit_app/core/error/failure.dart';

class RemoveOrderUseCase {
  final OrderRepositoriesImpl orderRepositoriesImpl;

  RemoveOrderUseCase({required this.orderRepositoriesImpl});
  Future<Either<Failure, Unit>> call({required OrderEntity orderEntity}) async {
    try {
      await orderRepositoriesImpl.removeOrder(orderEntity: orderEntity);
      return Future.value(right(unit));
    } catch (e) {
      return left(ServerFaliure(message: 'ServerFaliure'));
    }
  }
}
