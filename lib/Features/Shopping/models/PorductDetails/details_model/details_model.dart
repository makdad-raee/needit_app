import 'category.dart';
import 'color.dart';
import 'size.dart';

class DetailsModel {
  int? id;
  String? name;
  String? description;
  String? imageUrl;
  double? price;
  double? rate;
  int? totalSold;
  Category? category;
  List<Color>? colors;
  List<Size>? sizes;

  DetailsModel({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.price,
    this.rate,
    this.totalSold,
    this.category,
    this.colors,
    this.sizes,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        imageUrl: json['image_url'] as String?,
        price: (json['price'] as num?)?.toDouble(),
        rate: (json['rate'] as num?)?.toDouble(),
        totalSold: json['total_sold'] as int?,
        category: json['category'] == null
            ? null
            : Category.fromJson(json['category'] as Map<String, dynamic>),
        colors: (json['colors'] as List<dynamic>?)
            ?.map((e) => Color.fromJson(e as Map<String, dynamic>))
            .toList(),
        sizes: (json['sizes'] as List<dynamic>?)
            ?.map((e) => Size.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image_url': imageUrl,
        'price': price,
        'rate': rate,
        'total_sold': totalSold,
        'category': category?.toJson(),
        'colors': colors?.map((e) => e.toJson()).toList(),
        'sizes': sizes?.map((e) => e.toJson()).toList(),
      };
}
