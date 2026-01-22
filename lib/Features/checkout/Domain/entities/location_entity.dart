import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final String logo;
  final String name;

  final String details;

  const LocationEntity({
    required this.logo,
    required this.name,
    required this.details,
  });

  @override
  List<Object?> get props => [logo, name, details];
}
