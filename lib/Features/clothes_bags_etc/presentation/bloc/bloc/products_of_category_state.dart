part of 'products_of_category_bloc.dart';

@immutable
sealed class ProductsOfCategoryState {}

final class ProductsOfCategoryInitial extends ProductsOfCategoryState {}

class ProductsOfCategoryLoadingState extends ProductsOfCategoryState {}

class ProductsOfCategoryLoadedState extends ProductsOfCategoryState {
  final List<ProductEntityCategory> productsOfCategory;

  ProductsOfCategoryLoadedState({required this.productsOfCategory});
}

class ProductsOfCategoryErrorState extends ProductsOfCategoryState {
  final String errorMessage;

  ProductsOfCategoryErrorState({required this.errorMessage});
}
