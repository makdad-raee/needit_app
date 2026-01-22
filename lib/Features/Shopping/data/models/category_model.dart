import 'package:needit_app/Features/Shopping/domain/Entities/product_entity.dart';

class CategoryModel extends ProductEntity {
  const CategoryModel({
    required super.id,
    required super.key,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.discount,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      key: json['key'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
      discount: json['discount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'key': key,
      'name': name,
      'description': description,
      'image_url': imageUrl,
      'discount': discount,
    };
  }
}
