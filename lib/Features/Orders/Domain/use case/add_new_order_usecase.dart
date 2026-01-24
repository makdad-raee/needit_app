import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Orders/Data/repositories/order_repositories_impl.dart';
import 'package:needit_app/Features/Orders/Domain/entity/order_entity.dart';
import 'package:needit_app/core/error/failure.dart';

class AddNewOrderUsecase {
  final OrderRepositoriesImpl orderRepositories;

  AddNewOrderUsecase({required this.orderRepositories});
  Future<Either<Failure, Unit>> call({required OrderEntity orderEntity}) async {
    try {
      await orderRepositories.addOrder(orderEntity: orderEntity);
      return Future.value(right(unit));
    } catch (e) {
      return left(ServerFaliure(message: 'ServerFaliure'));
    }
  }
}
