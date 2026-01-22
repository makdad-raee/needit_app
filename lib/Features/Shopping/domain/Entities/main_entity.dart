import 'package:equatable/equatable.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/product_entity.dart';

class MainEntity extends Equatable {
  final ProductEntity productEntity;

  const MainEntity({required this.productEntity});

  @override
  List<Object?> get props => [productEntity];
}
