import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Shopping/models/PorductDetails/details_model/details_model.dart';
import 'package:needit_app/Features/Shopping/models/categories/categories.dart';
import 'package:needit_app/Features/Shopping/models/categories/main.dart';
import 'package:needit_app/Features/Shopping/models/categories/offer.dart';
import 'package:needit_app/Features/Shopping/models/categories/popular.dart';
import 'package:needit_app/Features/Shopping/models/products_of_categories/products_of_categories.dart';
import 'package:needit_app/core/NetworkApI/dio_helper.dart';
import 'package:needit_app/core/manger/cubit/Main%20cubit/main_view_state.dart';

class MainViewCubit extends Cubit<MainViewState> {
  MainViewCubit() : super(MainViewInitialState());
  static MainViewCubit get(context) {
    return BlocProvider.of(context);
  }

  List<Categories> allCategories = [];
  List<Offer> allOffers = [];
  List<Main> allMain = [];
  List<Popular> allPopular = [];

  void getAllCategories() async {
    emit(GetAllCategorieslLoadingState());
    allCategories = [];
    allOffers = [];
    allPopular = [];
    await DioHelper.getData(url: 'api/v1/categories/home', query: {})
        .then((value) {
          allCategories.add(Categories.fromJson(value.data['data']));
          for (int i = 0; i < allCategories[0].offers!.length; i++) {
            allOffers.add(allCategories[0].offers![i]);

            allPopular.add(allCategories[0].popular![i]);
            print(allOffers.length);
            print(allOffers[i].name);
          }
          for (int i = 0; i < allCategories[0].main!.length; i++) {
            allMain.add(allCategories[0].main![i]);
          }
          for (int i = 0; i < allCategories[0].popular!.length; i++) {
            allPopular.add(allCategories[0].popular![i]);
          }
          emit(GetAllCategorieslSucessState());
        })
        .catchError((error) {
          emit(GetAllCategorieslErrorState(error: error.toString()));
          print(error.toString());
        });
  }

  List<ProductsOfcategories> allProducts = [];
  List<ProductsOfcategories> clothesProducts = [];
  List<ProductsOfcategories> electronicProducts = [];
  List<ProductsOfcategories> bagsProducts = [];
  List<ProductsOfcategories> toysProducts = [];
  List<ProductsOfcategories> jwelryProducts = [];
  List<ProductsOfcategories> kitchenProducts = [];
  List<ProductsOfcategories> shoesProducts = [];
  List<ProductsOfcategories> watchesProducts = [];
  int currentIndex = 0;

  void getProductsCategories({required int limit, required int id}) async {
    allProducts = [];
    currentIndex = id;
    emit(GetProductsOfCategoriesLoadingState());
    await DioHelper.getData(
          url: 'api/v1/products',
          query: {'limit': limit, 'filter[category_id]': id},
        )
        .then((value) {
          for (int i = 0; i < value.data['data'].length; i++) {
            allProducts.add(
              ProductsOfcategories.fromJson(value.data['data'][i]),
            );
            emit(GetProductsOfCategoriesSucessState());
          }
          if (id == 8) {
            emit(GetProductsOfClothesLoadingState());

            for (int i = 0; i < value.data['data'].length; i++) {
              clothesProducts.add(
                ProductsOfcategories.fromJson(value.data['data'][i]),
              );
              emit(GetProductsOfClothesSucessState());
            }
          }
          if (id == 9) {
            //electronics
            for (int i = 0; i < value.data['data'].length; i++) {
              electronicProducts.add(
                ProductsOfcategories.fromJson(value.data['data'][i]),
              );
              emit(GetProductsOfElectronicSucessState());
            }
          }
          if (id == 10) {
            //bags
            for (int i = 0; i < value.data['data'].length; i++) {
              bagsProducts.add(
                ProductsOfcategories.fromJson(value.data['data'][i]),
              );
              emit(
                GetProductsOfBagsSucessState(
                  productsOfcategories: bagsProducts,
                ),
              );
            }
          }
          if (id == 11) {
            //Toys
            for (int i = 0; i < value.data['data'].length; i++) {
              toysProducts.add(
                ProductsOfcategories.fromJson(value.data['data'][i]),
              );
              emit(GetProductsOfToysSucessState());
            }
          }
          if (id == 12) {
            for (int i = 0; i < value.data['data'].length; i++) {
              jwelryProducts.add(
                ProductsOfcategories.fromJson(value.data['data'][i]),
              );
              emit(GetProductsOfJewelrySucessState());
            }
          }
          if (id == 13) {
            for (int i = 0; i < value.data['data'].length; i++) {
              kitchenProducts.add(
                ProductsOfcategories.fromJson(value.data['data'][i]),
              );
              emit(GetProductsOfKitchenSucessState());
            }
            //kitchen
          }
          if (id == 14) {
            for (int i = 0; i < value.data['data'].length; i++) {
              watchesProducts.add(
                ProductsOfcategories.fromJson(value.data['data'][i]),
              );
              emit(GetProductsOfWatchSucessState());
            }

            //watch
          }
          if (id == 15) {
            for (int i = 0; i < value.data['data'].length; i++) {
              shoesProducts.add(
                ProductsOfcategories.fromJson(value.data['data'][i]),
              );
              emit(GetProductsOfShoesSucessState());
            }

            //shoes
          }
          emit(GetProductsOfCategoriesSucessState());
        })
        .catchError((error) {
          emit(GetProductsOfCategoriesErrorState(error: error));
        });
  }

  List<DetailsModel> details = [];

  void showDetails({required int endPoints}) {
    DioHelper.getData(url: '/api/v1/products/1', query: {})
        .then((value) {
          details.add(DetailsModel.fromJson(value.data['data']));
          print('=================================');
          print(value.data['data']);
          print('=================================');
        })
        .catchError((error) {});
  }

  void isSelected({required bool isSelected}) {
    isSelected = !isSelected;
    emit(IsSelectedState());
  }

  List listLocalJson = [];

  // Future<void> readJsonFile() async {
  //   await File('assets/home_categories_response.json')
  //       .readAsString()
  //       .then((value) {
  //     listLocalJson.add(jsonDecode(value[1]));
  //     print(listLocalJson.length);
  //     // = jsonDecode(value);
  //     //  print(listLocalJson[0]['data']['main'][0]['name']);
  //   });
  //   //  var map = jsonDecode(input);
  //   // return map['users'];
  // }
  Future<void> readJsonFile() async {
    final String response = await rootBundle.loadString(
      'assets/home_categories_response.json',
    );
    final data = await json.decode(response);
    //listLocalJson.add(data[1]);
    print('=====================');
    print(data['data']['MAIN']);
    print('=====================');
  }
}
