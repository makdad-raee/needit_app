import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_item_model.dart';

abstract class CartLocalDataSource {
  Future<List<CartItemModel>> getCachedCart();
  Future<Unit> cacheCart(List<CartItemModel> cartItems);
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String cartKey = "CACHED_CART";

  CartLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<CartItemModel>> getCachedCart() async {
    final jsonString = sharedPreferences.getString(cartKey);
    if (jsonString != null) {
      List decodedData = json.decode(jsonString);
      // تحويل كل Map إلى Model
      return decodedData.map((item) => CartItemModel.fromMap(item)).toList();
    }
    return []; // سلة فارغة لو مفيش كاش
  }

  @override
  Future<Unit> cacheCart(List<CartItemModel> cartItems) async {
    // تحويل القائمة لـ JSON String
    final cartJson = cartItems.map((item) => item.toMap()).toList();
    await sharedPreferences.setString(cartKey, json.encode(cartJson));
    return unit;
  }
}
