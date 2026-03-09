import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/usecase/cache_cart_use_case.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/usecase/get_cashed_cart_use_case.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/cart_event.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/cart_state.dart';
import '../../Domain/Entities/cart_entity.dart';
import '../../Domain/Entities/cart_item_entity.dart';

// --- Bloc ---
class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCachedCartUseCase getCachedCartUseCase;
  final CacheCartUseCase cacheCartUseCase;

  CartBloc({required this.getCachedCartUseCase, required this.cacheCartUseCase})
    : super(const CartState()) {
    // 1. عند تشغيل التطبيق: جلب البيانات من الـ Local Storage
    on<LoadCartEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final result = await getCachedCartUseCase();

      result.fold(
        (failure) => emit(
          state.copyWith(isLoading: false, errorMessage: failure.message),
        ),
        (items) => emit(
          state.copyWith(isLoading: false, cart: CartEntity(items: items)),
        ),
      );
    });

    // 2. عند إضافة منتج
    on<AddToCartEvent>((event, emit) async {
      final List<CartItemEntity> currentItems = List.from(state.cart.items);
      final index = currentItems.indexWhere(
        (item) => item.productEntity.id == event.product.id,
      );

      if (index != -1) {
        // إذا المنتج موجود، زوّد الكمية باستخدام copyWith
        currentItems[index] = currentItems[index].copyWith(
          quantity: currentItems[index].quantity + 1,
        );
      } else {
        // إذا جديد، أضفه للقائمة
        currentItems.add(CartItemEntity(productEntity: event.product));
      }

      // تحديث الحالة فوراً في الـ UI
      final newCart = CartEntity(items: currentItems);
      emit(state.copyWith(cart: newCart));

      // حفظ القائمة الجديدة في الكاش (Local Storage) خلف الكواليس
      await cacheCartUseCase(currentItems);
    });

    // 3. تحديث الكمية (زيادة أو نقص أو حذف)
    on<UpdateQuantityEvent>((event, emit) async {
      // log("--- UpdateQuantity Debug ---");
      // log("Target Product ID: ${event.product.id}");
      // log(
      //   "Current Cart IDs: ${state.cart.items.map((e) => e.productEntity.id).toList()}",
      // );
      final List<CartItemEntity> currentItems = List.from(state.cart.items);
      final index = currentItems.indexWhere(
        (item) => item.productEntity.id == event.product.id,
      );

      if (index != -1) {
        if (event.quantity > 0) {
          currentItems[index] = currentItems[index].copyWith(
            quantity: event.quantity,
          );
        } else {
          currentItems.removeAt(index);
        }

        final newCart = CartEntity(items: currentItems);
        emit(state.copyWith(cart: newCart));
        await cacheCartUseCase(currentItems);
      }
    });
  }
}
