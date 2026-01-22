import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/checkout/Presentation/models/location_models.dart';
import 'package:needit_app/Features/checkout/Presentation/models/promo_models.dart';
import 'package:needit_app/Features/checkout/Presentation/models/shipping_type_models.dart';
import 'package:needit_app/constant.dart';

abstract class CheckoutRemoteDataSource {
  Future<Unit> addShippingType(ShippingTypeModels shippingTypeModel);
  Future<Unit> addlocation({required LocationModels locationModel});
  Future<Unit> addPromo({required PromoModels PromoModels});
}

class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  @override
  Future<Unit> addShippingType(ShippingTypeModels shippingTypeModel) {
    shippingTypeEntityNotifier.value = shippingTypeModel;
    return Future.value(unit);
  }

  @override
  Future<Unit> addlocation({required LocationModels locationModel}) {
    locationNotifier.value = locationModel;
    return Future.value(unit);
  }

  @override
  Future<Unit> addPromo({required PromoModels PromoModels}) {
    promoEntityNotifier.value = PromoModels;
    return Future.value(unit);
  }
}
