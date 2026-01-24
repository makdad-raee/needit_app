import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {
      // if (event is AllOrderEvent) {
      //   emit(AllorderSussess());
      // } else if (event is PaidOrderEvent) {
      //   emit(PaidOrderSussess());
      // } else if (event is DeliverdOrderEvent) {
      //   emit(DeliveredSussess());
      // } else if (event is CancelledOrderEvent) {
      //   emit(CancelledSussess());
      // }
    });
  }
}
