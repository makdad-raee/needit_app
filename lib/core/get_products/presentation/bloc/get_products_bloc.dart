import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/core/get_products/Domain/usecase/get_products_use_case.dart';
import 'package:needit_app/core/get_products/presentation/bloc/get_products_bloc_state.dart';
import 'package:needit_app/core/get_products/presentation/bloc/get_products_event.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  final GetProductsUseCase getProductsUseCase;
  GetProductsBloc({required this.getProductsUseCase})
    : super(GetProductsInitial()) {
    on<GetProductsEventStarted>((event, emit) async {
      emit(GetProductsLoading());
      // Simulate fetching products
      var productsOrError = await getProductsUseCase.call();
      productsOrError.fold(
        (error) {
          emit(GetProductsErrorState(message: error.toString()));
        },
        (products) {
          log("Products fetched successfully: ${products.length}");
          log(
            "Products fetched successfully: ${products.map((e) => e.name).toList()}",
          );
          emit(GetProductsSuccessState(products: products));
        },
      );
    });
  }
}
