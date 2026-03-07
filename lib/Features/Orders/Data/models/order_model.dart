import 'package:needit_app/Features/Add%20to%20cart/Data/models/cart_item_model.dart';
import 'package:needit_app/Features/checkout/Data/models/addres_model.dart';
import 'package:needit_app/Features/checkout/Data/models/shipping_methode_model.dart';

class OrderModel {
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

  OrderModel({
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
    this.status = 'pending',
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'userId': userId,
      'items': items.map((x) => x.toMap()).toList(),
      'address': address.toMap(),
      'shippingMethod': shippingMethod.toMap(),
      'paymentMethod': paymentMethod,
      'subTotal': subTotal,
      'shippingFee': shippingFee,
      'discountAmount': discountAmount,
      'totalAmount': totalAmount,
      'createdAt': createdAt.toIso8601String(),
      'status': status,
    };
  }
}
