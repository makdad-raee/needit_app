import 'package:equatable/equatable.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_entity.dart';

class OrderEntity extends Equatable {
  final List<CartEntity> cartsEntiy;
  final int totalPRice;

  const OrderEntity({required this.totalPRice, required this.cartsEntiy});
  @override
  List<Object?> get props => [cartsEntiy, totalPRice];
}
