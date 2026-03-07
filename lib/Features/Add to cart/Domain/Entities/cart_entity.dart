import 'package:equatable/equatable.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_item_entity.dart';

class CartEntity extends Equatable {
  final List<CartItemEntity> items;

  const CartEntity({this.items = const []});

  double get totalPrice =>
      items.fold(0, (total, item) => total + item.totalItemPrice);

  @override
  List<Object?> get props => [items];
}
