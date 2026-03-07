import 'package:equatable/equatable.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_item_entity.dart';

class OrderEntity extends Equatable {
  final String? id;
  final String uId; // معرف المستخدم (Firebase UID)
  final List<CartItemEntity> items;
  final double totalPrice;
  final DateTime createdAt;
  final String status;

  const OrderEntity({
    this.id,
    required this.uId,
    required this.items,
    required this.totalPrice,
    required this.createdAt,
    this.status = 'pending',
  });

  @override
  List<Object?> get props => [id, uId, items, totalPrice, createdAt, status];
}
