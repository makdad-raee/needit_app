import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final int id;
  final String name;
  late double totalPRice;
  late int quantity;
  final String? color;
  final String? size;
  final String? imageUrl;
  final dynamic priceOnePiesce;

  CartEntity({
    required this.name,
    required this.totalPRice,
    required this.quantity,
    required this.color,
    required this.size,
    required this.imageUrl,
    required this.id,
    required this.priceOnePiesce,
  });

  @override
  List<Object?> get props => [
        totalPRice,
        quantity,
        color,
        size,
        imageUrl,
        priceOnePiesce,
      ];
}
