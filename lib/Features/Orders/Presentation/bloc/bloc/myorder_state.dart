part of 'myorder_bloc.dart';

@immutable
sealed class MyorderState {}

class MyorderInitial extends MyorderState {}

final class AllorderLoaded extends MyorderState {}

final class AllorderError extends MyorderState {}

final class AllorderSussess extends MyorderState {}

final class PaidOrderLoaded extends MyorderState {}

final class PaidOrderError extends MyorderState {}

final class PaidOrderSussess extends MyorderState {}

final class CancelledLoaded extends MyorderState {}

final class CancelledError extends MyorderState {}

final class CancelledSussess extends MyorderState {}

final class DeliveredInitial extends MyorderState {}

final class DeliveredLoaded extends MyorderState {}

final class DeliveredError extends MyorderState {}

final class DeliveredSussess extends MyorderState {}
