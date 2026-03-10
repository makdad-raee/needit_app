import 'package:equatable/equatable.dart';
import 'package:needit_app/Features/Orders/Data/models/order_model.dart';
import 'package:needit_app/Features/Orders/Domain/entity/order_entity.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object?> get props => [];
}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersLoaded extends OrdersState {
  final List<OrderEntity> orders;
  const OrdersLoaded({required this.orders});

  @override
  List<Object?> get props => [orders];
}

class OrdersEmpty extends OrdersState {} // هذه للحالة الأولى في الصورة

class OrdersError extends OrdersState {
  final String message;
  const OrdersError({required this.message});

  @override
  List<Object?> get props => [message];
}
