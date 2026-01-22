part of 'details_bloc_bloc.dart';

@immutable
sealed class DetailsBlocEvent {}

class ShowDetailsOfProducts extends DetailsBlocEvent {
  final int id;
  ShowDetailsOfProducts({required this.id});
}
