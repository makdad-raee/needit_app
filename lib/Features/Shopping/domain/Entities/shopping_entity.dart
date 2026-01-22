import 'package:equatable/equatable.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/main_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/offer_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/popular_entity.dart';

class ShoppingEntity extends Equatable {
  final List<OfferEntity>? offers;
  final List<MainEntity>? main;
  final List<PopularEntity>? popular;

  const ShoppingEntity({
    required this.offers,
    required this.main,
    required this.popular,
  });
  @override
  List<Object?> get props => [offers, main, popular];
}
