import 'package:needit_app/Features/checkout/Domain/entities/address_entity.dart';
import 'package:needit_app/Features/checkout/Domain/entities/shipping_methode_entity.dart';

final List<AddressEntity> dummyAddresses = [
  const AddressEntity(
    title: 'Home',
    addressLine: '61480 Sunbrook Park, PC 5679',
  ),
  const AddressEntity(
    title: 'Office',
    addressLine: '6993 Meadow Valley Terrace, PC 3637',
  ),
  const AddressEntity(
    title: 'Apartment',
    addressLine: '47590 Bluebill Park, PC 1029',
  ),
  const AddressEntity(
    title: "Parent's House",
    addressLine: '12345 Sunset Blvd, PC 9021',
  ),
];

final List<ShippingMethodEntity> dummyShippingMethods = [
  const ShippingMethodEntity(
    name: 'Economy',
    duration: 'Est. Arrival Dec 20-23',
    price: 10.0,
  ),
  const ShippingMethodEntity(
    name: 'Regular',
    duration: 'Est. Arrival Dec 18-20',
    price: 15.0,
  ),
  const ShippingMethodEntity(
    name: 'Cargo',
    duration: 'Est. Arrival Dec 15-18',
    price: 20.0,
  ),
  const ShippingMethodEntity(
    name: 'Express',
    duration: 'Est. Arrival Dec 12-15',
    price: 30.0,
  ),
];
