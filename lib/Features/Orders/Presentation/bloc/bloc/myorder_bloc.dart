import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'myorder_event.dart';
part 'myorder_state.dart';

class MyorderBloc extends Bloc<MyorderEvent, MyorderState> {
  MyorderBloc() : super(MyorderInitial()) {
    on<MyorderEvent>((event, emit) {
      if (event is AllOrderEvent) {
        emit(AllorderSussess());
      } else if (event is PaidOrderEvent) {
        emit(PaidOrderSussess());
      } else if (event is DeliverdOrderEvent) {
        emit(DeliveredSussess());
      } else if (event is CancelledOrderEvent) {
        emit(CancelledSussess());
      }
    });
  }
}
