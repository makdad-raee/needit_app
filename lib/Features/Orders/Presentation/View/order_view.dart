import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Orders/Presentation/View/widgets/no_order.dart';
import 'package:needit_app/Features/Orders/Presentation/View/widgets/order_view_body.dart';
import 'package:needit_app/Features/Orders/Presentation/bloc/bloc/myorder_bloc.dart';
import 'package:needit_app/Features/Orders/Presentation/bloc/bloc/myorder_event.dart';
import 'package:needit_app/Features/Orders/Presentation/bloc/bloc/myorder_state.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/injection_container.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentUid = FirebaseAuth.instance.currentUser?.uid ?? '';
    return BlocProvider<OrdersBloc>(
      create:
          (context) =>
              sl<OrdersBloc>()..add(FetchMyOrdersEvent(userId: currentUid)),
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              SizedBox(width: 20),
              Text(
                'My Orders',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: kRubikBold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        body: BlocConsumer<OrdersBloc, OrdersState>(
          listener: (context, state) {
            if (currentUid == '') {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('User not logged in')));
            }
            if (state is OrdersError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is OrdersLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is OrdersLoaded) {
              return OrderViewBody(orders: state.orders);
            } else if (state is OrdersError) {
              return Center(child: Text(state.message));
            } else if (state is OrdersEmpty) {
              return Center(child: NoOrderWidgets());
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
