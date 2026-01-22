import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/product_details/data/models/details_model_new.dart';
import 'package:needit_app/core/error/excpetion.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DetailsLocalDataSource {
  Future<DetailsModelTdd> getCashedDetails();

  Future<Unit> cashedDetails(DetailsModelTdd detailsModel);
}

class DetailsLocalDataSourceImpl implements DetailsLocalDataSource {
  final SharedPreferences sharedPreferences;
  DetailsLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cashedDetails(DetailsModelTdd detailsModel) {
    final detailsFromLocal = detailsModel.toJson();
    sharedPreferences.setString('CASHED_DETAILS', jsonEncode(detailsFromLocal));
    return Future.value(unit);
  }

  @override
  Future<DetailsModelTdd> getCashedDetails() {
    final jsonString = sharedPreferences.getString('CASHED_DETAILS');
    if (jsonString != null) {
      final decodeJsonData = jsonDecode(jsonString);
      final jsonToDetailsModel = DetailsModelTdd.fromJson(decodeJsonData);
      return Future.value(jsonToDetailsModel);
    } else {
      throw EmptyCasheException();
    }
  }
}
