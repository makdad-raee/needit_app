import 'package:needit_app/Features/product_details/Domain/Entities/colors_entity.dart';

class ColorsNewModel extends ColorEntity {
  const ColorsNewModel({
    required super.id,
    required super.hex,
    required super.name,
  });
  factory ColorsNewModel.fromJson(Map<String, dynamic> json) {
    return ColorsNewModel(id: json['id'], hex: json['hex'], name: json['name']);
  }
  Map<String, dynamic> toJson() => {'id': id, 'hex': hex, 'name': name};
}
