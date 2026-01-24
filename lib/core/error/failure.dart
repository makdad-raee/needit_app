import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});
}

class OfflineFaliure extends Failure {
  const OfflineFaliure({required super.message});

  @override
  List<Object?> get props => [];
}

class ServerFaliure extends Failure {
  const ServerFaliure({required super.message});

  @override
  List<Object?> get props => [];
}

class EmptyCasheFailure extends Failure {
  const EmptyCasheFailure({required super.message});

  @override
  List<Object?> get props => [];
}
