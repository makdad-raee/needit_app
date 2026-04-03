import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_item_entity.dart';
import 'package:needit_app/core/get_products/data/models/product_model.dart';

class CartItemModel extends CartItemEntity {
  const CartItemModel({
    required super.productEntity,
    super.quantity,
    super.selectedSize,
    super.selectedColor,
  });

  factory CartItemModel.fromEntity(CartItemEntity entity) {
    return CartItemModel(
      productEntity: entity.productEntity,
      quantity: entity.quantity,
      selectedSize: entity.selectedSize,
      selectedColor: entity.selectedColor,
    );
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      productEntity: ProductModel.fromMap(map['product']),
      quantity: map['quantity'] as int,
      // 👇 التعديل هنا: قراءة اللون والقياس من الكاش
      selectedSize: map['selectedSize'] as String?,
      selectedColor: map['selectedColor'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': (productEntity as ProductModel).toMap(),
      'quantity': quantity,
      // 👇 التعديل هنا: حفظ اللون والقياس في الكاش
      'selectedSize': selectedSize,
      'selectedColor': selectedColor,
    };
  }
}
