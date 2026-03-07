import 'package:needit_app/Features/checkout/Domain/entities/shipping_methode_entity.dart';

class ShippingMethodModel extends ShippingMethodEntity {
  const ShippingMethodModel({
    required super.name,
    required super.duration,
    required super.price,
  });

  factory ShippingMethodModel.fromEntity(ShippingMethodEntity entity) {
    return ShippingMethodModel(
      name: entity.name,
      duration: entity.duration,
      price: entity.price,
    );
  }

  factory ShippingMethodModel.fromMap(Map<String, dynamic> map) {
    return ShippingMethodModel(
      name: map['name'] ?? 'Unknown',
      duration: map['duration'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'duration': duration, 'price': price};
  }
}
