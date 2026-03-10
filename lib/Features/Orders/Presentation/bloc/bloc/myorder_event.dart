import 'package:equatable/equatable.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object?> get props => [];
}

class FetchMyOrdersEvent extends OrdersEvent {
  final String userId;
  const FetchMyOrdersEvent({required this.userId});

  @override
  List<Object?> get props => [userId];
}
