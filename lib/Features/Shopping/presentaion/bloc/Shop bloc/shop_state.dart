part of 'shop_bloc.dart';

abstract class ShopState extends Equatable {}

final class ShopInitial extends ShopState {
  @override
  List<Object?> get props => [];
}

class ShopLoading extends ShopState {
  @override
  List<Object?> get props => [];
}

class ShopLoaded extends ShopState {
  final List<MainEntity> main;
  final List<OfferEntity> offer;
  final List<PopularEntity> popular;
  final List<ProductEntityCategory>? clothes;
  final List<ProductEntityCategory>? shoes;

  final List<ProductEntityCategory>? electronics;

  final List<ProductEntityCategory>? toys;

  final List<ProductEntityCategory>? kitchen;

  final List<ProductEntityCategory>? jwelry;

  final List<ProductEntityCategory>? watch;
  final List<ProductEntityCategory>? bags;

  ShopLoaded({
    this.clothes,
    this.shoes,
    this.electronics,
    this.toys,
    this.kitchen,
    this.jwelry,
    this.watch,
    this.bags,
    required this.offer,
    required this.popular,
    required this.main,
  });
  @override
  List<Object?> get props => [
        main,
        offer,
        popular,
        clothes,
        shoes,
        electronics,
        toys,
        kitchen,
        jwelry,
        watch
      ];
}

class ShopError extends ShopState {
  final String error;
  ShopError(this.error);
  @override
  List<Object?> get props => [error];
}

//| catego
class GetProductsOFAnycategory extends ShopState {
  final List<ProductEntityCategory> productsAnycategory;

  GetProductsOFAnycategory({required this.productsAnycategory});
  @override
  List<Object?> get props => [productsAnycategory];
}

class GetAllClothesState extends ShopState {
  final List<ProductEntityCategory> clothes;

  GetAllClothesState({required this.clothes});
  @override
  List<Object?> get props => [clothes];
}

class GetAllElectronicsState extends ShopState {
  final List<ProductEntityCategory> electronics;

  GetAllElectronicsState({required this.electronics});

  @override
  List<Object?> get props => [electronics];
}

class GetAllBagsState extends ShopState {
  final List<ProductEntityCategory> bags;
  GetAllBagsState({required this.bags});

  @override
  List<Object?> get props => [bags];
}

class GetAllWatchState extends ShopState {
  final List<ProductEntityCategory> watchs;
  GetAllWatchState({required this.watchs});
  @override
  List<Object?> get props => [watchs];
}

class GetAllToysState extends ShopState {
  final List<ProductEntityCategory> toys;
  GetAllToysState({required this.toys});
  @override
  List<Object?> get props => [toys];
}

class GetAllJwelryState extends ShopState {
  final List<ProductEntityCategory> jewelry;

  GetAllJwelryState({required this.jewelry});

  @override
  List<Object?> get props => [jewelry];
}

class GetAllKitchenState extends ShopState {
  final List<ProductEntityCategory> kitchen;
  GetAllKitchenState({required this.kitchen});
  @override
  List<Object?> get props => [kitchen];
}

class GetAllShoesState extends ShopState {
  final List<ProductEntityCategory> shoes;
  GetAllShoesState({required this.shoes});
  @override
  List<Object?> get props => [shoes];
}
