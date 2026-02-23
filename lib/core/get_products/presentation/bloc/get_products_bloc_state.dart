import 'package:needit_app/core/get_products/Domain/entity/product_entity.dart';

abstract class GetProductsState {}

class GetProductsInitial extends GetProductsState {}

class GetProductsLoading extends GetProductsState {}

class GetProductsSuccessState extends GetProductsState {
  final List<ProductEntity> products;
  GetProductsSuccessState({required this.products});
}

class GetProductsErrorState extends GetProductsState {
  final String message;
  GetProductsErrorState({required this.message});
}
