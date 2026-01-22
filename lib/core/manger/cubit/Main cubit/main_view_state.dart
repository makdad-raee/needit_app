import 'package:needit_app/Features/Shopping/models/products_of_categories/products_of_categories.dart';

class MainViewState {}

class MainViewInitialState extends MainViewState {}

class GetAllCategorieslLoadingState extends MainViewState {}

class GetAllCategorieslSucessState extends MainViewState {}

class GetAllCategorieslErrorState extends MainViewState {
  final String error;

  GetAllCategorieslErrorState({required this.error});
}

class GetClotheslLoadingState extends MainViewState {}

class GetClotheslSucessState extends MainViewState {}

class GetClotheslErrorState extends MainViewState {
  final String error;

  GetClotheslErrorState({required this.error});
}

class GetProductsOfCategoriesLoadingState extends MainViewState {}

class GetProductsOfCategoriesSucessState extends MainViewState {}

class GetProductsOfCategoriesErrorState extends MainViewState {
  final String error;

  GetProductsOfCategoriesErrorState({required this.error});
}

class GetProductsOfClothesLoadingState extends MainViewState {}

class GetProductsOfClothesSucessState extends MainViewState {}

class GetProductsOfClothesErrorState extends MainViewState {
  final String error;

  GetProductsOfClothesErrorState({required this.error});
}

class GetProductsOfElectronicLoadingState extends MainViewState {}

class GetProductsOfElectronicSucessState extends MainViewState {}

class GetProductsOfElectronicErrorState extends MainViewState {
  final String error;

  GetProductsOfElectronicErrorState({required this.error});
}

class GetProductsOfBagsLoadingState extends MainViewState {}

class GetProductsOfBagsSucessState extends MainViewState {
  final List<ProductsOfcategories> productsOfcategories;

  GetProductsOfBagsSucessState({required this.productsOfcategories});
}

class GetProductsOfBagsErrorState extends MainViewState {
  final String error;

  GetProductsOfBagsErrorState({required this.error});
}

class GetProductsOfToysLoadingState extends MainViewState {}

class GetProductsOfToysSucessState extends MainViewState {}

class GetProductsOfToysErrorState extends MainViewState {
  final String error;

  GetProductsOfToysErrorState({required this.error});
}

class GetProductsOfShoesLoadingState extends MainViewState {}

class GetProductsOfShoesSucessState extends MainViewState {}

class GetProductsOfShoesErrorState extends MainViewState {
  final String error;

  GetProductsOfShoesErrorState({required this.error});
}

class GetProductsOfWatchLoadingState extends MainViewState {}

class GetProductsOfWatchSucessState extends MainViewState {}

class GetProductsOfWatchErrorState extends MainViewState {
  final String error;

  GetProductsOfWatchErrorState({required this.error});
}

class GetProductsOfJewelryLoadingState extends MainViewState {}

class GetProductsOfJewelrySucessState extends MainViewState {}

class GetProductsOfJewelryErrorState extends MainViewState {
  final String error;

  GetProductsOfJewelryErrorState({required this.error});
}

class GetProductsOfKitchenLoadingState extends MainViewState {}

class GetProductsOfKitchenSucessState extends MainViewState {}

class GetProductsOfKitchenErrorState extends MainViewState {
  final String error;

  GetProductsOfKitchenErrorState({required this.error});
}

class IsSelectedState extends MainViewState {}
