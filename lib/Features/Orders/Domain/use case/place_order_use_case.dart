import 'package:needit_app/Features/Orders/Data/models/order_model.dart';
import 'package:needit_app/Features/checkout/Domain/Repositories/check_out_repo.dart';

class PlaceOrderUseCase {
  final CheckoutRepository repository;

  PlaceOrderUseCase(this.repository);

  Future<void> call(OrderModel order) async {
    return await repository.placeOrder(order);
  }
}
