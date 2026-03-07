import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_item_entity.dart';
import 'package:needit_app/core/get_products/data/models/product_model.dart';

class CartItemModel extends CartItemEntity {
  const CartItemModel({required super.productEntity, super.quantity});

  factory CartItemModel.fromEntity(CartItemEntity entity) {
    return CartItemModel(productEntity: entity.productEntity);
  }
  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      productEntity: ProductModel.fromMap(
        map['product'],
      ), // نفترض وجود ProductModel
      quantity: map['quantity'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': (productEntity as ProductModel).toMap(),
      'quantity': quantity,
    };
  }
}
