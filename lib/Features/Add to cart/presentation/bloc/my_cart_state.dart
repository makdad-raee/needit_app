part of 'my_cart_bloc.dart';

@immutable
sealed class MyCartState {}

final class MyCartInitial extends MyCartState {}

class MyCartLoading extends MyCartState {}

class MyCartLoaded extends MyCartState {
  final List<CartEntity> myCart;
  MyCartLoaded(this.myCart);
}

class MyCartError extends MyCartState {
  final String message;
  MyCartError(this.message);
}
