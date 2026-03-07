import 'package:needit_app/core/get_products/Domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    super.id,
    required super.categoryID,
    required super.name,
    required super.description,
    required super.code,
    required super.image,
    required super.isFeatured,
    required super.sizes,
    required super.colors,
    super.avRating,
    super.ratingCount,
    super.imageUrl,
    required super.reviews,
    required super.price,
    super.originalPrice,
    required super.isOffer,
  });
  factory ProductModel.fromUserEntity(ProductEntity productInputEntity) {
    return ProductModel(
      id: productInputEntity.id,
      categoryID: productInputEntity.categoryID,
      name: productInputEntity.name,
      code: productInputEntity.code,
      description: productInputEntity.description,
      image: productInputEntity.image,
      isFeatured: productInputEntity.isFeatured,
      sizes: productInputEntity.sizes,
      colors: productInputEntity.colors,
      avRating: productInputEntity.avRating,
      ratingCount: productInputEntity.ratingCount,
      imageUrl: productInputEntity.imageUrl,
      reviews: productInputEntity.reviews,
      isOffer: productInputEntity.isOffer,
      price: productInputEntity.price,
      originalPrice: productInputEntity.originalPrice,
    );
  }
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? 'ID not provided',
      categoryID: map['categoryID'] ?? 'Category ID not provided',
      name: map['name'] ?? 'Name not provided',
      code: map['code'] ?? 'Code not provided',
      description: map['description'] ?? 'Description not provided',
      image: null,
      isFeatured: map['isFeatured'],
      sizes: List<String>.from(map['sizes']) ?? [],
      colors: List<int>.from(map['colors']) ?? [],
      avRating: (map['avRating'] ?? 0.0).toDouble(),
      ratingCount: (map['ratingCount'] ?? 0).toInt(),
      imageUrl: map['imageUrl'] ?? '',
      reviews:
          List<ReviewEntity>.from(
            map['reviews']?.map((x) => ReviewModel.fromMap(map: x)),
          ) ??
          [],
      price: (map['price'] ?? 0).toDouble(),
      originalPrice:
          map['originalPrice'] != null
              ? (map['originalPrice'] as num).toDouble()
              : null,
      isOffer: map['isOffer'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryID': categoryID,
      'name': name,
      'description': description,
      'code': code,
      // 'image': image,
      'isFeatured': isFeatured,
      'sizes': sizes,
      'colors': colors,
      'avRating': avRating,
      'ratingCount': ratingCount,
      'imageUrl': imageUrl,
      'originalPrice': originalPrice,
      'price': price,
      'isOffer': isOffer,
      'reviews':
          reviews
              .map((e) => ReviewModel.fromReviewEntity(reviewEntity: e).toMap())
              .toList(),
    };
  }
}
