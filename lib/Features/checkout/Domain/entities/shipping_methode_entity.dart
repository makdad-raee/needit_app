import 'package:equatable/equatable.dart';

class ShippingMethodEntity extends Equatable {
  final String name;
  final String duration;
  final double price;

  const ShippingMethodEntity({
    required this.name,
    required this.duration,
    required this.price,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, duration, price];
}
