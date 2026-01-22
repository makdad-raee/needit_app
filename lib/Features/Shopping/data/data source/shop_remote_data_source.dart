import 'dart:convert';

import 'package:needit_app/Features/Shopping/data/models/main_model.dart';
import 'package:needit_app/Features/Shopping/data/models/offer_model.dart';
import 'package:needit_app/Features/Shopping/data/models/popular_model.dart';
import 'package:needit_app/Features/Shopping/data/models/product_model_from_category.dart';
import 'package:needit_app/core/NetworkApI/dio_helper.dart';
import 'package:needit_app/core/error/excpetion.dart';

abstract class ShopRemoteDataSource {
  Future<List<OfferModel>> getAllOffer();
  Future<List<MainModel>> getAllMain();
  Future<List<PopularModel>> getAllPopular();
  Future<List<ProductModelForCategory>> getProductsOFGategory({
    required int limit,
    required int id,
  });
}

class ShopRemoteDataSourceIml implements ShopRemoteDataSource {
  @override
  Future<List<MainModel>> getAllMain() async {
    print('============getAllMain===========');
    final response = await DioHelper.getData(
      url: 'home_page_categories',
      // 'api/v1/categories/home',
      query: {},
    );
    if (response.statusCode == 200) {
      final datamainJson = response;
      final decodeDataJson = json.decode(datamainJson.toString());
      print(decodeDataJson);
      List decodeMainJsonData = decodeDataJson['data']['MAIN'];
      print('4444444444444444444444444');
      print(decodeMainJsonData);
      print('===========decode json Length=========');
      // final List<Map<String, dynamic>> decodeMainJson =
      //     json.decode(datamainJson) as List<Map<String, dynamic>>;

      print('===========decode json Length=========');
      print(decodeMainJsonData.length);
      List<MainModel> mainModels =
          decodeMainJsonData
              .map<MainModel>(
                (jsonMainModel) => MainModel.fromJson(jsonMainModel),
              )
              .toList();
      print(mainModels[0].productEntity.imageUrl);
      return Future.value(mainModels);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<OfferModel>> getAllOffer() async {
    final response = await DioHelper.getData(
      url: 'home_page_categories',
      //  'api/v1/categories/home',
      query: {},
    );
    if (response.statusCode == 200) {
      final datamainJson = response;
      final decodeDataJson = json.decode(datamainJson.toString());
      print(decodeDataJson);
      List decodeOfferJsonData = decodeDataJson['data']['OFFERS'];

      List<OfferModel> offerModels =
          decodeOfferJsonData
              .map<OfferModel>(
                (jsonOfferModel) => OfferModel.fromJson(jsonOfferModel),
              )
              .toList();
      return Future.value(offerModels);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PopularModel>> getAllPopular() async {
    final response = await DioHelper.getData(
      url: 'home_page_categories',
      //'api/v1/categories/home',
      query: {},
    );
    if (response.statusCode == 200) {
      final datamainJson = response;
      final decodeDataJson = json.decode(datamainJson.toString());
      print(decodeDataJson);
      List decodPopularJsonData = decodeDataJson['data']['POPULAR'];

      List<PopularModel> offerModels =
          decodPopularJsonData
              .map<PopularModel>(
                (jsonPopularModel) => PopularModel.fromJson(jsonPopularModel),
              )
              .toList();
      return Future.value(offerModels);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModelForCategory>> getProductsOFGategory({
    required int limit,
    required int id,
  }) async {
    print('====== test===getProductsOFGategory===========');
    final response = await DioHelper.getData(
      url: 'products_of_category',
      //  'api/v1/products',
      query: {},
      //  {
      //   // 'limit': limit,
      //   // 'filter[category_id]': id,
      // }
    );
    if (response.statusCode == 200) {
      print('====== test===getProductsOFGategory==222=========');
      final datamainJson = response;
      final decodeDataJson = json.decode(datamainJson.toString());
      //print(decodeDataJson);
      List decodProductJsonData = decodeDataJson['data'];
      print(decodeDataJson['data']);

      List<ProductModelForCategory> productModels =
          decodProductJsonData
              .map<ProductModelForCategory>(
                (jsonProductModel) =>
                    ProductModelForCategory.fromJson(jsonProductModel),
              )
              .toList();
      return Future.value(productModels);
    } else {
      throw ServerException();
    }
  }
}
