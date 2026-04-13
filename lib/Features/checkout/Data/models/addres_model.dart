import 'package:needit_app/Features/checkout/Domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  const AddressModel({
    required super.title,
    required super.addressLine,
    super.isSelected,
    required super.latitude,
    required super.longitude,
  });

  // تحويل من Entity لموديل (بستخدمها لما بدي أبعت داتا)
  factory AddressModel.fromEntity(AddressEntity entity) {
    return AddressModel(
      title: entity.title,
      addressLine: entity.addressLine,
      isSelected: entity.isSelected,
      latitude: entity.latitude,
      longitude: entity.longitude,
    );
  }

  // القراءة من Map (Firebase/Cache)
  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      title: map['title'] ?? 'No Title',
      addressLine: map['addressLine'] ?? 'No Address Line',
      isSelected: map['isSelected'] ?? false,
      latitude: map['latitude'] ?? 0.0,
      longitude: map['longitude'] ?? 0.0,
    );
  }

  // الكتابة إلى Map (لإرسالها مع الطلب)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'addressLine': addressLine,
      'isSelected': isSelected,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
