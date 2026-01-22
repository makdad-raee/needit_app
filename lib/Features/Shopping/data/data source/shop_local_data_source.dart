import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:needit_app/Features/Shopping/data/models/main_model.dart';
import 'package:needit_app/Features/Shopping/data/models/offer_model.dart';
import 'package:needit_app/Features/Shopping/data/models/popular_model.dart';
import 'package:needit_app/Features/Shopping/data/models/product_model_from_category.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ShopLocalDataSource {
  Future<List<OfferModel>> getCachedOffer();
  Future<List<MainModel>> getCachedMain();
  Future<List<PopularModel>> getCachedPopular();
  Future<Unit> cachedOffer(List<OfferModel> offerModel);
  Future<Unit> cachedMain(List<MainModel> mainModel);
  Future<Unit> cachesPopular(List<PopularModel> popularModel);
  Future<List<ProductModelForCategory>> getCachedProductsofCategory({
    required int id,
  });
  Future<Unit> cashedProductsofCategory(
    List<ProductModelForCategory> productModel,
  );
}

class ShopLocalDataSourceImpl extends ShopLocalDataSource {
  final SharedPreferences sharedPreferences;

  ShopLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cachedMain(List<MainModel> mainModel) {
    List mainModelToJson =
        mainModel
            .map<Map<String, dynamic>>((mainModel) => mainModel.toJson())
            .toList();
    sharedPreferences.setString('CASHED_MAIN', jsonEncode(mainModelToJson));
    return Future.value(unit);
  }

  @override
  Future<Unit> cachedOffer(List<OfferModel> offerModel) {
    List offerModelToJson =
        offerModel
            .map<Map<String, dynamic>>((offerModel) => offerModel.toJson())
            .toList();
    sharedPreferences.setString('CASHED_OFFER', jsonEncode(offerModelToJson));
    return Future.value(unit);
  }

  @override
  Future<Unit> cachesPopular(List<PopularModel> popularModel) {
    List popularModelToJson =
        popularModel
            .map<Map<String, dynamic>>((popularModel) => popularModel.toJson())
            .toList();

    sharedPreferences.setString(
      'CASHED_POPULAR',
      jsonEncode(popularModelToJson),
    );
    return Future.value(unit);
  }

  @override
  Future<List<MainModel>> getCachedMain() async {
    final jsonString = sharedPreferences.getString('CASHED_MAIN');
    if (jsonString != null) {
      List decodeJsonData = jsonDecode(jsonString);
      List<MainModel> jsonToMainModel =
          decodeJsonData
              .map<MainModel>(
                (jsonMainModel) => MainModel.fromJson(jsonMainModel),
              )
              .toList();
      return Future.value(jsonToMainModel);
    } else {
      final String response = await rootBundle.loadString(
        'assets/home_categories_response.json',
      );
      final data = await json.decode(response);
      List decodeJsonDataFromFile = data['data']['MAIN'];
      List<MainModel> jsonToMainModelFromFile =
          decodeJsonDataFromFile.map<MainModel>((jsonMainModel) {
            return MainModel.fromJson(jsonMainModel);
          }).toList();
      return Future.value(jsonToMainModelFromFile);
      //  throw EmptyCasheException();
    }
  }

  @override
  Future<List<OfferModel>> getCachedOffer() async {
    final jsonString = sharedPreferences.getString('CASHED_OFFER');
    if (jsonString != null) {
      List decodeJsonData = jsonDecode(jsonString);
      List<OfferModel> jsonToOfferModel =
          decodeJsonData
              .map<OfferModel>(
                (jsonOfferModel) => OfferModel.fromJson(jsonOfferModel),
              )
              .toList();
      return Future.value(jsonToOfferModel);
    } else {
      final String response = await rootBundle.loadString(
        'assets/home_categories_response.json',
      );
      final data = await json.decode(response);
      List decodeJsonDataFromFile = data['data']['OFFERS'];
      List<OfferModel> jsonToMainModelFromFile =
          decodeJsonDataFromFile.map<OfferModel>((jsonMainModel) {
            return OfferModel.fromJson(jsonMainModel);
          }).toList();
      return Future.value(jsonToMainModelFromFile);
      // throw EmptyCasheException();
    }
  }

  @override
  Future<List<PopularModel>> getCachedPopular() async {
    final jsonString = sharedPreferences.getString('CASHED_POPULAR');
    if (jsonString != null) {
      List decodeJsonData = jsonDecode(jsonString);
      List<PopularModel> jsonToPopularModel =
          decodeJsonData
              .map<PopularModel>(
                (jsonPopularModel) => PopularModel.fromJson(jsonPopularModel),
              )
              .toList();
      return Future.value(jsonToPopularModel);
    } else {
      final String response = await rootBundle.loadString(
        'assets/home_categories_response.json',
      );
      final data = await json.decode(response);
      List decodeJsonDataFromFile = data['data']['POPULAR'];
      List<PopularModel> jsonToMainModelFromFile =
          decodeJsonDataFromFile.map<PopularModel>((jsonMainModel) {
            return PopularModel.fromJson(jsonMainModel);
          }).toList();
      return Future.value(jsonToMainModelFromFile);
      //  throw EmptyCasheException();
    }
  }

  @override
  Future<Unit> cashedProductsofCategory(
    List<ProductModelForCategory> productModel,
  ) {
    // TODO: implement cashedProductsofCategory
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModelForCategory>> getCachedProductsofCategory({
    required int id,
  }) async {
    final String response = await rootBundle.loadString(
      'assets/products_of_category.json',
    );
    final data = await json.decode(response);
    List decodeJsonDataFromFile = data['data'];
    List<ProductModelForCategory> jsonToMainModelFromFile =
        decodeJsonDataFromFile.map<ProductModelForCategory>((jsonMainModel) {
          return ProductModelForCategory.fromJson(jsonMainModel);
        }).toList();
    return Future.value(jsonToMainModelFromFile);

    //   throw UnimplementedError();
  }
}
