import 'package:equatable/equatable.dart';
import 'package:needit_app/Features/Add%20to%20cart/Data/models/cart_item_model.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_item_entity.dart';
import 'package:needit_app/Features/checkout/Data/models/addres_model.dart';
import 'package:needit_app/Features/checkout/Data/models/shipping_methode_model.dart';

class OrderEntity extends Equatable {
  final String orderId;
  final String userId;
  final List<CartItemModel> items;
  final AddressModel address;
  final ShippingMethodModel shippingMethod;
  final String paymentMethod;
  final double subTotal;
  final double shippingFee;
  final double discountAmount;
  final double totalAmount;
  final DateTime createdAt;
  final String status;

  const OrderEntity({
    this.status = 'pending',
    required this.orderId,
    required this.userId,
    required this.items,
    required this.address,
    required this.shippingMethod,
    required this.paymentMethod,
    required this.subTotal,
    required this.shippingFee,
    required this.discountAmount,
    required this.totalAmount,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    orderId,
    userId,
    items,
    address,
    shippingMethod,
    paymentMethod,
    subTotal,
    shippingFee,
    discountAmount,
    totalAmount,
    createdAt,
    status,
  ];
}
