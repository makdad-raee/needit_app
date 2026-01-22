import 'package:equatable/equatable.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/product_entity.dart';
import 'package:needit_app/Features/product_details/Domain/Entities/colors_entity.dart';
import 'package:needit_app/Features/product_details/Domain/Entities/sizes_entity.dart';

class DetailsEntity extends Equatable {
  final dynamic id;
  final String name;
  final String description;
  final String? imageUrl;
  final dynamic price;
  final dynamic rate;
  final dynamic totalSold;
  final ProductEntity? category;
  final List<ColorEntity>? colors;
  final List<SizesEntity>? sizes;

  const DetailsEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rate,
    required this.totalSold,
    required this.category,
    required this.colors,
    required this.sizes,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    imageUrl,
    price,
    rate,
    totalSold,
    category,
    colors,
    sizes,
  ];
}
