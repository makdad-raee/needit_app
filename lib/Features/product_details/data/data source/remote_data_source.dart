import 'dart:convert';

import 'package:needit_app/Features/product_details/data/models/details_model_new.dart';
import 'package:needit_app/core/NetworkApI/dio_helper.dart';
import 'package:needit_app/core/error/excpetion.dart';

abstract class DetailsRemoteDataSource {
  Future<DetailsModelTdd> getDetailsOfProducts({required int id});
}

class DetailsRemoteDataSourceImpl implements DetailsRemoteDataSource {
  @override
  Future<DetailsModelTdd> getDetailsOfProducts({required int id}) async {
    final response = await DioHelper.getData(
      url: 'product_details',
      //   'api/v1/products/$id',
      query: {},
    );
    if (response.statusCode == 200) {
      final decdedDetailsJson = json.decode(response.toString());

      return DetailsModelTdd.fromJson(
        decdedDetailsJson,
        // ['data']
      );
    } else {
      throw ServerException();
    }
  }
}
