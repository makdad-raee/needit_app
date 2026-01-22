import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_entity.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/usecase/add_products_to_cart_usecase.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/usecase/get_all_cart_use_case.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/usecase/remove_from_cart_usecase.dart';
import 'package:needit_app/constant.dart';

part 'my_cart_event.dart';
part 'my_cart_state.dart';

class MyCartBloc extends Bloc<MyCartEvent, MyCartState> {
  final GetAllCartUseCase getAllCartUseCase;
  final AddProductsToCartUsecase addProductsToCartUsecase;
  final RemoveFromnCartUsecase removeFromnCartUsecase;
  MyCartBloc({
    required this.getAllCartUseCase,
    required this.addProductsToCartUsecase,
    required this.removeFromnCartUsecase,
  }) : super(MyCartInitial()) {
    on<MyCartEvent>((event, emit) async {
      if (event is GetAllCartEvent) {
        final result = await getAllCartUseCase.call();
        result.fold(
          (failure) {
            emit(MyCartError(failure.toString()));
          },
          (cartEntity) {
            emit(MyCartLoaded(cartEntity));
          },
        );
      } else if (event is AddToCartEvent) {
        // emit(MyCartLoading());
        await addProductsToCartUsecase.call(event.cartEntity);
        final resultAfterAdd = await getAllCartUseCase.call();
        resultAfterAdd.fold(
          (failure) {
            emit(MyCartError(failure.toString()));
          },
          (cartEntity) {
            if (cartentityNotifer.value.contains(cartEntity.first) == false) {
              emit(MyCartLoaded(cartEntity));
              cartentityNotifer.value.add(cartEntity.first);
              print('=====cartEntity length======${cartEntity.length}');

              print(
                '=====cartEntity length======${cartentityNotifer.value.length}',
              );
            }
          },
        );
      } else if (event is RemoveFromCartEvent) {
        await removeFromnCartUsecase.call(event.cartEntity);
        cartentityNotifer.value.removeWhere((element) {
          kTotalPrice -= event.cartEntity.totalPRice;
          return element == event.cartEntity;
        });
        emit(MyCartLoading());
        emit(MyCartLoaded(cartentityNotifer.value));

        //final resultAfterAdd = await getAllCartUseCase.call();
        // resultAfterAdd.fold(
        //   (failure) {
        //     emit(MyCartError(failure.toString()));
        //   },
        //   (cartEntity) {
        //     emit(MyCartLoaded(cartEntity));
        //     print('=====cartEntity length======${cartEntity.length}');
        //     cartentityNotifer.value.removeWhere(
        //       (element) => element == event.cartEntity,
        //     );

        //     print(
        //         '=====cartEntity length======${cartentityNotifer.value.length}');
        //   },
        // );
      }
    });
  }
}
