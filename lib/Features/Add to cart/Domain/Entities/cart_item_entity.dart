import 'package:equatable/equatable.dart';
import 'package:needit_app/core/get_products/Domain/entity/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  final int quantity;

  const CartItemEntity({required this.productEntity, this.quantity = 1});
  CartItemEntity copyWith({ProductEntity? product, int? quantity}) {
    return CartItemEntity(
      productEntity: product ?? productEntity,
      quantity: quantity ?? this.quantity,
    );
  }

  // حساب سعر المنتج الواحد في الكمية
  double get totalItemPrice => productEntity.price * quantity.toDouble();

  // دالة لزيادة أو نقص الكمية بسهولة
  CartItemEntity increment() => copyWith(quantity: quantity + 1);
  CartItemEntity decrement() {
    if (quantity > 1) {
      return copyWith(quantity: quantity - 1);
    }
    return this;
  }

  @override
  List<Object?> get props => [productEntity, quantity];
}
