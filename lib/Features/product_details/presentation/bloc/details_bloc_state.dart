part of 'details_bloc_bloc.dart';

@immutable
sealed class DetailsBlocState {}

final class DetailsBlocInitial extends DetailsBlocState {}

class DetailsBlocLoading extends DetailsBlocState {}

class DetailsBlocLoadedState extends DetailsBlocState {
  final DetailsEntity details;
  DetailsBlocLoadedState({required this.details});
}

class DetailsBlocErrorState extends DetailsBlocState {
  final Failure failure;
  DetailsBlocErrorState({required this.failure});
}
