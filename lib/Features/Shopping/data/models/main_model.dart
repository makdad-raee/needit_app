import 'package:needit_app/Features/Shopping/domain/Entities/main_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/product_entity.dart';

class MainModel extends MainEntity {
  const MainModel({required super.productEntity});
  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      productEntity: ProductEntity(
        id: json['id'],
        key: json['key'],
        name: json['name'],
        description: json['description'],
        imageUrl: json['image_url'],
        discount: json['discount'],
      ),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': productEntity.id,
      'key': productEntity.key,
      'name': productEntity.name,
      'description': productEntity.description,
      'image_url': productEntity.imageUrl,
      'discount': productEntity.discount,
    };
  }
}
