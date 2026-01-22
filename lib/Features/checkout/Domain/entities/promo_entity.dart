import 'package:equatable/equatable.dart';

class PromoEntity extends Equatable {
  final String logo;
  final String name;
  final String details;

  const PromoEntity({
    required this.logo,
    required this.name,
    required this.details,
  });

  @override
  List<Object?> get props => [
        logo,
        name,
        details,
      ];
}
