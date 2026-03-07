import 'package:equatable/equatable.dart';
import 'package:needit_app/Features/Add%20to%20cart/Data/models/cart_item_model.dart';
import 'package:needit_app/Features/checkout/Data/models/payment_methode_model.dart';
import 'package:needit_app/Features/checkout/Domain/entities/address_entity.dart';
import 'package:needit_app/Features/checkout/Domain/entities/shipping_methode_entity.dart';

import 'package:equatable/equatable.dart';
import 'package:needit_app/Features/checkout/Domain/entities/address_entity.dart';
import 'package:needit_app/Features/checkout/Domain/entities/shipping_methode_entity.dart';
import 'package:needit_app/Features/checkout/data/models/promo_code_model.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();
  @override
  List<Object?> get props => [];
}

// 1. تحميل البيانات الأولية عند فتح الشاشة
class LoadCheckoutInitialData extends CheckoutEvent {
  final double subTotal;
  const LoadCheckoutInitialData(this.subTotal);

  @override
  List<Object?> get props => [subTotal];
}

// 2. اختيار عنوان شحن
class SelectShippingAddress extends CheckoutEvent {
  final AddressEntity address;
  const SelectShippingAddress(this.address);

  @override
  List<Object?> get props => [address];
}

// 3. اختيار وسيلة شحن
class SelectShippingMethod extends CheckoutEvent {
  final ShippingMethodEntity method;
  const SelectShippingMethod(this.method);

  @override
  List<Object?> get props => [method];
}

// 4. اختيار وسيلة دفع (PayPal, Google Pay, etc.)
class SelectPaymentMethod extends CheckoutEvent {
  final PaymentMethodModel paymentMethod;
  const SelectPaymentMethod(this.paymentMethod);

  @override
  List<Object?> get props => [paymentMethod];
}

// 5. تطبيق كود الخصم (Promo Code)
class ApplyPromoCodeEvent extends CheckoutEvent {
  final PromoCodeModel promo;
  const ApplyPromoCodeEvent(this.promo);

  @override
  List<Object?> get props => [promo];
}

// 6. الحدث النهائي: تأكيد الطلب وإرساله لـ Firebase
class ConfirmOrderEvent extends CheckoutEvent {
  final String userId;
  final List<CartItemModel> cartItems;

  const ConfirmOrderEvent({required this.userId, required this.cartItems});

  @override
  List<Object?> get props => [userId, cartItems];
}
