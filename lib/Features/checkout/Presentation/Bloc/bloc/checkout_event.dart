part of 'checkout_bloc.dart';

@immutable
sealed class CheckoutEvent {}

class AddlocationEvent extends CheckoutEvent {
  final LocationEntity locationEntity;

  AddlocationEvent({required this.locationEntity});
}

class AddPromoEvent extends CheckoutEvent {
  final PromoEntity promoEntity;

  AddPromoEvent({required this.promoEntity});
}

class AddShippingTypeEvent extends CheckoutEvent {
  final ShippingTypeEntity shippingTypeEntity;

  AddShippingTypeEvent({required this.shippingTypeEntity});
}
