import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Add%20to%20cart/Data/models/Cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CartRemoteSource {
  Future<Unit> addToCart({required List<CartModel> cartModels});
  Future<Unit> removeFromCart({required List<CartModel> cartModels});
}

class CartRemoteSourceImpl implements CartRemoteSource {
  SharedPreferences sharedPreferences;
  CartRemoteSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> addToCart({required List<CartModel> cartModels}) async {
    List cartModelTojson =
        cartModels
            .map<Map<String, dynamic>>((cartmodel) => cartmodel.toJson())
            .toList();
    print('================addToCart================');
    sharedPreferences.setString('CASHED_CART', jsonEncode(cartModelTojson));
    print('================CASHED_CART================');
    return Future.value(unit);
  }

  @override
  Future<Unit> removeFromCart({required List<CartModel> cartModels}) {
    // sharedPreferences.remove(
    //   'CASHED_CART',
    // );
    List cartModelTojson =
        cartModels
            .map<Map<String, dynamic>>((cartmodel) => cartmodel.toJson())
            .toList();
    print('================remove================');
    sharedPreferences.setString('CASHED_CART', jsonEncode(cartModelTojson));
    print('================Afterremoooove================');
    return Future.value(unit);
  }
}
