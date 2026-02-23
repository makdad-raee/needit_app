import 'package:equatable/equatable.dart';

class ProductEntityOld extends Equatable {
  final int id;
  final dynamic key;
  final String? name;
  final String? description;
  final dynamic imageUrl;
  final int? discount;

  const ProductEntityOld({
    required this.id,
    required this.key,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.discount,
  });
  @override
  List<Object?> get props => [id, key, name, description, imageUrl, discount];
}
