import 'dart:convert';

import 'package:needit_app/Features/Add%20to%20cart/Data/models/Cart_model.dart';
import 'package:needit_app/core/error/excpetion.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CartLocalDataSource {
  Future<List<CartModel>> getAllCart();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  SharedPreferences sharedPreferences;
  CartLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<List<CartModel>> getAllCart() {
    final jsonDataCart = sharedPreferences.getString('CASHED_CART');
    if (jsonDataCart != null) {
      final decodedData = jsonDecode(jsonDataCart);
      print(decodedData);
      final List<CartModel> decodeJsonData =
          //  decodeJsonData.add(CartModel.fromJson(decodedData));
          decodedData
              .map<CartModel>((json) => CartModel.fromJson(json))
              .toList();
      print(decodeJsonData);
      return Future.value(decodeJsonData);
    } else {
      throw EmptyCasheException();
    }
  }
}
