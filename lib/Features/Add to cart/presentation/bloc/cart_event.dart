// --- Events ---
import 'package:equatable/equatable.dart';
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
  const AddToCartEvent(this.product);
}

class UpdateQuantityEvent extends CartEvent {
  final ProductEntity product;
  final int quantity;
  const UpdateQuantityEvent(this.product, this.quantity);
}

class ClearCartEvent extends CartEvent {} // لمسح السلة بعد إتمام الطلب
