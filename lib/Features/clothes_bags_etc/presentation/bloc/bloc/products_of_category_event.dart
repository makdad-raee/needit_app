part of 'products_of_category_bloc.dart';

@immutable
sealed class ProductsOfCategoryEvent {}

class GetAllProductsOfCategroyEvent extends ProductsOfCategoryEvent {
  final int id;
  GetAllProductsOfCategroyEvent({required this.id});
}
