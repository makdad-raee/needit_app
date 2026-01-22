part of 'my_cart_bloc.dart';

@immutable
sealed class MyCartEvent {}

class GetAllCartEvent extends MyCartEvent {}

class AddToCartEvent extends MyCartEvent {
  final CartEntity cartEntity;
  final int id;
  AddToCartEvent({required this.cartEntity, required this.id});
}

class RemoveFromCartEvent extends MyCartEvent {
  final int id;
  final CartEntity cartEntity;
  RemoveFromCartEvent({required this.id, required this.cartEntity});
}
