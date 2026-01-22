import 'main.dart';
import 'offer.dart';
import 'popular.dart';

class Categories {
  List<Offer>? offers;
  List<Main>? main;
  List<Popular>? popular;

  Categories({this.offers, this.main, this.popular});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      offers: (json['OFFERS'] as List<dynamic>?)?.map((e) {
        return Offer.fromJson(e as Map<String, dynamic>);
      }).toList(),
      main: (json['MAIN'] as List<dynamic>?)?.map((e) {
        return Main.fromJson(e as Map<String, dynamic>);
      }).toList(),
      popular: (json['POPULAR'] as List<dynamic>?)?.map((e) {
        return Popular.fromJson(e as Map<String, dynamic>);
      }).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'OFFERS': offers?.map((e) => e.toJson()).toList(),
        'MAIN': main?.map((e) => e.toJson()).toList(),
        'POPULAR': popular?.map((e) => e.toJson()).toList(),
      };
}
