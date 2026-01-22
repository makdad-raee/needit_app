import 'package:equatable/equatable.dart';

class SizesEntity extends Equatable {
  final int id;
  final String shortcut;
  final String name;

  const SizesEntity(
      {required this.id, required this.shortcut, required this.name});
  @override
  List<Object?> get props => throw UnimplementedError();
}
