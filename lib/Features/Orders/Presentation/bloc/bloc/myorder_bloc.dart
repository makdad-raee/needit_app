import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:needit_app/Features/Orders/Domain/use%20case/get_orders_use_case.dart';
import 'package:needit_app/Features/Orders/Presentation/bloc/bloc/myorder_event.dart';
import 'package:needit_app/Features/Orders/Presentation/bloc/bloc/myorder_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetOrdersUseCase getOrdersUseCase;

  OrdersBloc({required this.getOrdersUseCase}) : super(OrdersInitial()) {
    on<FetchMyOrdersEvent>((event, emit) async {
      emit(OrdersLoading());

      final result = await getOrdersUseCase.call(userId: event.userId);

      result.fold((failure) => emit(OrdersError(message: failure.message)), (
        orders,
      ) {
        if (orders.isEmpty) {
          emit(OrdersEmpty());
        } else {
          emit(OrdersLoaded(orders: orders));
        }
      });
    });
  }
}
