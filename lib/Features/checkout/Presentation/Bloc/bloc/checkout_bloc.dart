import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:needit_app/Features/checkout/Domain/entities/location_entity.dart';
import 'package:needit_app/Features/checkout/Domain/entities/promo_entity.dart';
import 'package:needit_app/Features/checkout/Domain/entities/shipping_type_entity.dart';
import 'package:needit_app/Features/checkout/Domain/use%20case/add_location_use_case.dart';
import 'package:needit_app/Features/checkout/Domain/use%20case/add_promo_code_use_case.dart';
import 'package:needit_app/Features/checkout/Domain/use%20case/add_shipping_type_use_case.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final AddLocationUseCase addLocationUseCase;
  final AddPromoCodeUseCase addPromoCodeUseCase;
  final AddShippingTypeUseCase addShippingTypeUseCase;
  CheckoutBloc(
    this.addLocationUseCase,
    this.addPromoCodeUseCase,
    this.addShippingTypeUseCase,
  ) : super(CheckoutInitial()) {
    on<CheckoutEvent>((event, emit) async {
      if (event is AddPromoEvent) {
        await addPromoCodeUseCase.call(PromoEntity: event.promoEntity);
      } else if (event is AddlocationEvent) {
        await addLocationUseCase.call(shippingentity: event.locationEntity);
        emit(CheckoutSuccess());
      } else if (event is AddShippingTypeEvent) {
        await addShippingTypeUseCase.call(
          shippingTypeEntity: event.shippingTypeEntity,
        );
      }
    });
  }
}
