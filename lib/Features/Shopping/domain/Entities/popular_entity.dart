import 'package:equatable/equatable.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/product_entity_old.dart';

class PopularEntity extends Equatable {
  final ProductEntityOld productEntity;

  const PopularEntity({required this.productEntity});

  @override
  List<Object?> get props => [productEntity];
}
