import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:needit_app/Features/product_details/Domain/Entities/details_entity.dart';
import 'package:needit_app/Features/product_details/Domain/Use%20case/get_details_use_case.dart';
import 'package:needit_app/core/error/failure.dart';

part 'details_bloc_event.dart';
part 'details_bloc_state.dart';

class DetailsBlocBloc extends Bloc<DetailsBlocEvent, DetailsBlocState> {
  final GetDetailsUseCase getDetailsUseCase;
  DetailsBlocBloc({required this.getDetailsUseCase})
    : super(DetailsBlocInitial()) {
    on<DetailsBlocEvent>((event, emit) async {
      if (event is ShowDetailsOfProducts) {
        emit(DetailsBlocLoading());
        final detailsOrFailure = await getDetailsUseCase.call(id: event.id);
        detailsOrFailure.fold(
          (failure) {
            emit(DetailsBlocErrorState(failure: failure));
          },
          (detailEntity) {
            emit(DetailsBlocLoadedState(details: detailEntity));
          },
        );
      }
    });
  }
}
