import 'package:equatable/equatable.dart';

class ProductEntityCategory extends Equatable {
  final int id;

  final String? name;
  final String? description;
  final dynamic price;
  final dynamic rate;
  final dynamic totalSold;
  final String? imageUrl;

  const ProductEntityCategory(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.rate,
      required this.totalSold,
      required this.imageUrl});
  @override
  List<Object?> get props =>
      [id, name, description, price, rate, totalSold, imageUrl];
}
