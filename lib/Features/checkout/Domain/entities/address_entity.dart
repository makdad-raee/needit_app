import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String title;
  final String addressLine;
  final bool isSelected;

  const AddressEntity({
    required this.title,
    required this.addressLine,
    this.isSelected = false,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [title, addressLine, isSelected];
}
