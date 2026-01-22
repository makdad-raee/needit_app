import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/main_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/offer_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/popular_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/product_entity_category.dart';
import 'package:needit_app/Features/Shopping/domain/Use%20cases/get_all_main.dart';
import 'package:needit_app/Features/Shopping/domain/Use%20cases/get_all_offers.dart';
import 'package:needit_app/Features/Shopping/domain/Use%20cases/get_all_popular.dart';
import 'package:needit_app/Features/Shopping/domain/Use%20cases/get_products_of_category.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/error/failure.dart';
import 'package:needit_app/core/strings/faliures.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final GetAllMainUseCase getAllMainUseCase;
  final GetAllOffersUseCase getAllOfferUseCase;
  final GetAllPopularUseCase getAllPopularUseCase;
  final GetProductsOfCategoryUseCase getProductsOfCategoryUseCase;
  ShopBloc({
    required this.getAllMainUseCase,
    required this.getAllOfferUseCase,
    required this.getAllPopularUseCase,
    required this.getProductsOfCategoryUseCase,
  }) : super(ShopInitial()) {
    on<ShopEvent>((event, emit) async {
      if (event is GetAllMainEvent) {
        print('=============GetAllMainEvent==============');
        emit(ShopLoading());
        final allMAinORFailure = await getAllMainUseCase.call();
        final allPopularORFailure = await getAllPopularUseCase.call();
        final alloffersorFailure = await getAllOfferUseCase.call();
        allMAinORFailure.fold(
          (faliure) {
            emit(ShopError(mapFailureToMessage(faliure)));
          },
          (main) {
            //   emit(ShopLoaded(main: main));
          },
        );

        if (allMAinORFailure.isRight()) {
          emit(
            ShopLoaded(
              // bags: allBagsORFailure.getOrElse(() => []),
              // jwelry: allJwelryORFailure.getOrElse(() => []),
              // kitchen: allKitchenORFailure.getOrElse(() => []),
              // shoes: allShoesORFailure.getOrElse(() => []),
              // toys: allToysORFailure.getOrElse(() => []),
              // watch: allWatchORFailure.getOrElse(() => []),
              // electronics: allElectronicsORFailure.getOrElse(() => []),
              // clothes: allClothesORFailure.getOrElse(() => []),
              offer: alloffersorFailure.getOrElse(() => []),
              popular: allPopularORFailure.getOrElse(() => []),
              main: allMAinORFailure.getOrElse(() => []),
            ),
          );
        }
      } else if (event is GetAllOfferEvent) {
        emit(ShopLoading());
        final alloffersorFailure = await getAllOfferUseCase.call();
        alloffersorFailure.fold(
          (faliure) {
            emit(ShopError(mapFailureToMessage(faliure)));
          },
          (main) {
            //emit(ShopLoaded(main: main));
          },
        );
      } else if (event is GetAllPopularEvent) {
        emit(ShopLoading());
        final allPopularORFailure = await getAllMainUseCase.call();
        allPopularORFailure.fold(
          (faliure) {
            emit(ShopError(mapFailureToMessage(faliure)));
          },
          (main) {
            //    emit(ShopLoaded(main: main));
          },
        );
      } else if (event is GetAllClothesEvent) {
        final allClothesORFailure = await getProductsOfCategoryUseCase.call(
          id: 8,
          limit: limit,
        );
        allClothesORFailure.fold(
          (faliure) {
            emit(ShopError(mapFailureToMessage(faliure)));
          },
          (clothes) {
            productsEntityNotifer.value = clothes;
          },
        );
      } else if (event is GetAllElectronicsEvent) {
        final allElectronicsORFailure = await getProductsOfCategoryUseCase.call(
          id: 9,
          limit: limit,
        );
        allElectronicsORFailure.fold(
          (faliure) {
            emit(ShopError(mapFailureToMessage(faliure)));
          },
          (electronics) {
            productsEntityNotifer.value = [];
            productsEntityNotifer.value = electronics;
          },
        );
      } else if (event is GetAllBagsEvent) {
        final allBagsORFailure = await getProductsOfCategoryUseCase.call(
          id: 10,
          limit: limit,
        );
        allBagsORFailure.fold(
          (faliure) {
            emit(ShopError(mapFailureToMessage(faliure)));
          },
          (bags) {
            productsEntityNotifer.value = [];
            productsEntityNotifer.value = bags;
          },
        );
      } else if (event is GetAllToysEvent) {
        final allToysORFailure = await getProductsOfCategoryUseCase.call(
          id: 11,
          limit: limit,
        );
        allToysORFailure.fold(
          (faliure) {
            emit(ShopError(mapFailureToMessage(faliure)));
          },
          (toys) {
            productsEntityNotifer.value = [];
            productsEntityNotifer.value = toys;
          },
        );
      } else if (event is GetAllJwelryEvent) {
        final allJwelryORFailure = await getProductsOfCategoryUseCase.call(
          id: 12,
          limit: limit,
        );
        allJwelryORFailure.fold(
          (faliure) {
            emit(ShopError(mapFailureToMessage(faliure)));
          },
          (jewelry) {
            productsEntityNotifer.value = [];
            productsEntityNotifer.value = jewelry;
          },
        );
      } else if (event is GetAllKitchenEvent) {
        final allKitchenORFailure = await getProductsOfCategoryUseCase.call(
          id: 13,
          limit: limit,
        );
        allKitchenORFailure.fold(
          (faliure) {
            emit(ShopError(mapFailureToMessage(faliure)));
          },
          (kitchen) {
            productsEntityNotifer.value = [];
            productsEntityNotifer.value = kitchen;
          },
        );
      } else if (event is GetAllWatchEvent) {
        final allWatchORFailure = await getProductsOfCategoryUseCase.call(
          id: 14,
          limit: limit,
        );
        allWatchORFailure.fold(
          (faliure) {
            emit(ShopError(mapFailureToMessage(faliure)));
          },
          (watch) {
            productsEntityNotifer.value = [];
            productsEntityNotifer.value = watch;
          },
        );
      } else if (event is GetAllShoesEvent) {
        final allShoesORFailure = await getProductsOfCategoryUseCase.call(
          id: 15,
          limit: limit,
        );
        allShoesORFailure.fold(
          (faliure) {
            emit(ShopError(mapFailureToMessage(faliure)));
          },
          (shoes) {
            productsEntityNotifer.value = [];
            productsEntityNotifer.value = shoes;
          },
        );
      }
    });
  }
  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFaliure:
        return serverFaliureMessage;
      case OfflineFaliure:
        return offlineFaliureMessage;
      case EmptyCasheFailure:
        return emptyCasheFaliureMessage;

      default:
        return 'unexpected error please try again later';
    }
  }
}
