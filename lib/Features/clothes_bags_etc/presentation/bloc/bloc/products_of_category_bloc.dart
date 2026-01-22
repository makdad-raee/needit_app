import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/product_entity_category.dart';
import 'package:needit_app/Features/Shopping/domain/Use%20cases/get_products_of_category.dart';
import 'package:needit_app/constant.dart';

part 'products_of_category_event.dart';
part 'products_of_category_state.dart';

class ProductsOfCategoryBloc
    extends Bloc<ProductsOfCategoryEvent, ProductsOfCategoryState> {
  final GetProductsOfCategoryUseCase getProductsOfCategoryUseCase;
  ProductsOfCategoryBloc({required this.getProductsOfCategoryUseCase})
    : super(ProductsOfCategoryInitial()) {
    on<ProductsOfCategoryEvent>((event, emit) async {
      if (event is GetAllProductsOfCategroyEvent) {
        emit(ProductsOfCategoryLoadingState());
        final productsOfCategoryOrFailure = await getProductsOfCategoryUseCase
            .call(id: event.id, limit: limit);
        productsOfCategoryOrFailure.fold(
          (failure) {
            emit(
              ProductsOfCategoryErrorState(errorMessage: failure.toString()),
            );
          },
          (productsOfCategory) {
            emit(
              ProductsOfCategoryLoadedState(
                productsOfCategory: productsOfCategory,
              ),
            );
          },
        );
      }
    });
  }
}
