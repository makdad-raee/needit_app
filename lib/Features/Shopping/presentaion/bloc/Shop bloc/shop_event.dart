part of 'shop_bloc.dart';

@immutable
sealed class ShopEvent {}

class GetAllMainEvent extends ShopEvent {}

class GetAllOfferEvent extends ShopEvent {}

class GetAllPopularEvent extends ShopEvent {}

class GetAllClothesEvent extends ShopEvent {}

class GetAllElectronicsEvent extends ShopEvent {}

class GetAllBagsEvent extends ShopEvent {}

class GetAllWatchEvent extends ShopEvent {}

class GetAllToysEvent extends ShopEvent {}

class GetAllJwelryEvent extends ShopEvent {}

class GetAllKitchenEvent extends ShopEvent {}

class GetAllShoesEvent extends ShopEvent {}
