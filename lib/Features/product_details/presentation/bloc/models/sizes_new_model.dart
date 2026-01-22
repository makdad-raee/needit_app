import 'package:needit_app/Features/product_details/Domain/Entities/sizes_entity.dart';

class SizesNewModel extends SizesEntity {
  const SizesNewModel({
    required super.id,
    required super.shortcut,
    required super.name,
  });

  factory SizesNewModel.fromJson(Map<String, dynamic> json) {
    return SizesNewModel(
      id: json['id'],
      shortcut: json['shortcut'],
      name: json['name'],
    );
  }
  Map<String, dynamic> toJson() => {
    'id': id,
    'shortcut': shortcut,
    'name': name,
  };
}
