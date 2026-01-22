part of 'myorder_bloc.dart';

@immutable
sealed class MyorderEvent {}

class AllOrderEvent extends MyorderEvent {}

class PaidOrderEvent extends MyorderEvent {}

class DeliverdOrderEvent extends MyorderEvent {}

class CancelledOrderEvent extends MyorderEvent {}
