import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    required super.totalPRice,
    required super.quantity,
    required super.color,
    required super.size,
    required super.imageUrl,
    required super.id,
    required super.name,
    required super.priceOnePiesce,
  });
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      totalPRice: json['total_price'],
      quantity: json['quantity'],
      color: json['color'],
      size: json['size'],
      imageUrl: json['image'],
      id: json['id'],
      name: json['name'],
      priceOnePiesce: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_price': totalPRice,
      'quantity': quantity,
      'color': color,
      'size': size,
      'image': imageUrl,
      'id': id,
      'name': name,
      'price': priceOnePiesce,
    };
  }
}
