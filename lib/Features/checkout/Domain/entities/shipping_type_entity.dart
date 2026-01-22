import 'package:equatable/equatable.dart';

class ShippingTypeEntity extends Equatable {
  final String logo;
  final String name;
  final String price;
  final String details;

  const ShippingTypeEntity({
    required this.logo,
    required this.name,
    required this.price,
    required this.details,
  });

  @override
  List<Object?> get props => [logo, name, price, details];
}
