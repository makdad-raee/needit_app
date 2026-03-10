import 'package:needit_app/Features/Add%20to%20cart/Data/models/cart_item_model.dart';
import 'package:needit_app/Features/Orders/Domain/entity/order_entity.dart';
import 'package:needit_app/Features/checkout/Data/models/addres_model.dart';
import 'package:needit_app/Features/checkout/Data/models/shipping_methode_model.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.orderId,
    required super.userId,
    required super.items,
    required super.address,
    required super.shippingMethod,
    required super.paymentMethod,
    required super.subTotal,
    required super.shippingFee,
    required super.discountAmount,
    required super.totalAmount,
    required super.createdAt,
    super.status,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['orderId'],
      userId: map['userId'],
      items: List<CartItemModel>.from(
        map['items']?.map((x) => CartItemModel.fromMap(x)),
      ),
      address: AddressModel.fromMap(map['address']),
      shippingMethod: ShippingMethodModel.fromMap(map['shippingMethod']),
      paymentMethod: map['paymentMethod'],
      subTotal: map['subTotal'].toDouble(),
      shippingFee: map['shippingFee'].toDouble(),
      discountAmount: map['discountAmount'].toDouble(),
      totalAmount: map['totalAmount'].toDouble(),
      createdAt: DateTime.parse(map['createdAt']),
      status: map['status'] ?? 'pending',
    );
  }
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
