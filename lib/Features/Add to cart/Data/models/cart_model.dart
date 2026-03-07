import 'package:needit_app/Features/Add%20to%20cart/Data/models/cart_item_model.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_entity.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_item_entity.dart';

class CartModel extends CartEntity {
  const CartModel({required super.items});
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      items:
          json['items'] != null
              ? List<CartItemEntity>.from(
                json['items'].map((item) => CartItemModel.fromMap(item)),
              )
              : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => (item as CartItemModel).toMap()).toList(),
    };
  }
}
