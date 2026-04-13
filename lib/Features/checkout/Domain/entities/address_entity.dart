import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String? id; // 👈 ضفنا الـ ID وخليناه اختياري
  final String title;
  final String addressLine;
  final double latitude; // 👈 ضفنا خط العرض
  final double longitude;
  final bool isSelected;

  const AddressEntity({
    this.id, // 👈
    required this.title,
    required this.addressLine,
    required this.latitude,
    required this.longitude,

    this.isSelected = false,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    addressLine,
    isSelected,
    latitude,
    longitude,
  ];
}
