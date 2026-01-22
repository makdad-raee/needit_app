import 'package:equatable/equatable.dart';

class ColorEntity extends Equatable {
  final int id;
  final String hex;
  final String name;

  const ColorEntity({
    required this.id,
    required this.hex,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        hex,
        name,
      ];
}
