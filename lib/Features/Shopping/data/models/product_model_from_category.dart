import 'package:needit_app/Features/Shopping/domain/Entities/product_entity_category.dart';

class ProductModelForCategory extends ProductEntityCategory {
  const ProductModelForCategory({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.price,
    required super.rate,
    required super.totalSold,
  });

  factory ProductModelForCategory.fromJson(Map<String, dynamic> json) {
    return ProductModelForCategory(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
      price: json['price'],
      rate: json['rate'],
      totalSold: json['total_sold'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image_url': imageUrl,
      'price': price,
      'rate': rate,
      'total_sold': totalSold,
    };
  }
}
