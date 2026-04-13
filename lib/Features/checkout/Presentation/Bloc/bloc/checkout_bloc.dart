import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/Data/models/cart_item_model.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/usecase/check_out_use_case.dart';
import 'package:needit_app/Features/Orders/Data/models/order_model.dart';
import 'package:needit_app/Features/checkout/Data/models/addres_model.dart';
import 'package:needit_app/Features/checkout/Data/models/shipping_methode_model.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_event.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_state.dart';
import 'package:needit_app/dummy_data.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CheckoutUseCase checkoutUseCase;
  CheckoutBloc({required this.checkoutUseCase}) : super(const CheckoutState()) {
    // 1. تحميل البيانات الأولية
    on<LoadCheckoutInitialData>((event, emit) {
      emit(state.copyWith(isLoading: true));
      final currentAddresses = state.addresses;

      final shippingModels =
          dummyShippingMethods
              .map((e) => ShippingMethodModel.fromEntity(e))
              .toList();
      // إذا مافي عنوان محدد، نختار أول عنوان في القائمة (إذا كانت القائمة مو فاضية)
      final initialAddress =
          state.selectedAddress ??
          (currentAddresses.isNotEmpty ? currentAddresses.first : null);
      emit(
        state.copyWith(
          isLoading: false,
          addresses: currentAddresses,
          selectedAddress: null,
          shippingMethods: shippingModels,
          subTotal: event.subTotal,
          totalAmount: event.subTotal, // لسه ما اخترنا شحن
        ),
      );
    });

    // 2. تغيير العنوان المختار
    on<SelectShippingAddress>((event, emit) {
      final addressModel = AddressModel.fromEntity(event.address);
      emit(state.copyWith(selectedAddress: addressModel).calculateTotals());
    });

    // 3. اختيار وسيلة الشحن وحساب المجموع النهائي
    on<SelectShippingMethod>((event, emit) {
      // تحويل الـ Entity القادمة من الـ Event إلى Model
      final methodModel = ShippingMethodModel.fromEntity(event.method);

      // تحديث الـ State ثم استدعاء calculateTotals لحساب السعر النهائي تلقائياً
      emit(
        state.copyWith(selectedShippingMethod: methodModel).calculateTotals(),
      );
    });
    on<ConfirmOrderEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      try {
        final List<CartItemModel> itemModels =
            event.cartItems.map((entity) {
              return CartItemModel.fromEntity(entity);
            }).toList();
        // تجميع البيانات في OrderModel واحد
        final order = OrderModel(
          orderId: DateTime.now().millisecondsSinceEpoch.toString(), // ID مؤقت
          userId: event.userId,
          items: itemModels, // نمررها من الـ Event
          address: state.selectedAddress!,
          shippingMethod: state.selectedShippingMethod!,
          paymentMethod: state.selectedPaymentMethod?.name ?? "PayPal",
          subTotal: state.subTotal,
          shippingFee: state.shippingFee,
          discountAmount: state.discountAmount,
          totalAmount: state.totalAmount,
          createdAt: DateTime.now(),
        );

        final result = await checkoutUseCase.call(order);
        result.fold(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (success) =>
              emit(state.copyWith(isLoading: false, isOrderSuccess: true)),
        );
      } catch (e) {
        emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
      }
    });
    // 1. تحميل البيانات الأولية (للـ Checkout)
    on<LoadUserAddressesEvent>((event, emit) {
      emit(state.copyWith(isLoading: true));

      final currentAddresses = state.addresses;

      emit(
        state.copyWith(
          isLoading: false,
          addresses: currentAddresses,
          selectedAddress: null,
        ),
      );
    });
    // 6. حفظ عنوان جديد أو تحديثه
    on<SaveAddressEvent>((event, emit) {
      // تحويل الـ Entity القادم من الشاشة إلى Model
      final newAddressModel = AddressModel.fromEntity(event.address);

      // أخذ نسخة من العناوين القديمة وإضافة العنوان الجديد لها
      final List<AddressModel> updatedList = List.from(state.addresses)
        ..add(newAddressModel);

      // إذا كانت القائمة السابقة فارغة، نجعل هذا العنوان هو "المختار افتراضياً"
      final newSelectedAddress = state.selectedAddress ?? newAddressModel;

      // تحديث واجهة المستخدم (UI)
      emit(
        state.copyWith(
          addresses: updatedList,
          selectedAddress: newSelectedAddress,
        ),
      );
    });
  }
}
