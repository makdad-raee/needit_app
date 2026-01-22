import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFaliure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFaliure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCasheFailure extends Failure {
  @override
  List<Object?> get props => [];
}
