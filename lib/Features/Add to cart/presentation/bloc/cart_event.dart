// --- Events ---
import 'package:equatable/equatable.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_item_entity.dart';
import 'package:needit_app/core/get_products/Domain/entity/product_entity.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
  @override
  List<Object> get props => [];
}

class LoadCartEvent extends CartEvent {} // لجلب السلة عند فتح التطبيق

class AddToCartEvent extends CartEvent {
  // Debug print
  final ProductEntity product;
  final int quantity;
  final String? selectedSize;
  final int? selectedColor;
  const AddToCartEvent({
    required this.product,
    this.quantity = 1,
    this.selectedSize,
    this.selectedColor,
  });
}

class UpdateQuantityEvent extends CartEvent {
  final CartItemEntity cartItem;
  final int quantity;
  const UpdateQuantityEvent(this.cartItem, this.quantity);
}

class ClearCartEvent extends CartEvent {} // لمسح السلة بعد إتمام الطلب

class RemoveFromCartEvent extends CartEvent {
  final CartItemEntity cartItem;

  const RemoveFromCartEvent(this.cartItem);

  @override
  List<Object> get props => [cartItem];
}
