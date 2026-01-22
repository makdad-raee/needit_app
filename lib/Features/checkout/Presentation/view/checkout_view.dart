import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_entity.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_bloc.dart';
import 'package:needit_app/Features/checkout/Presentation/view/Widgets/checkout_view_body.dart';
import 'package:needit_app/constant.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartList});
  final List<CartEntity> cartList;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutBloc, CheckoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Checkout',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: kRubikRubikMedium,
                fontSize: 18,
              ),
            ),
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 0,
            actions: [Icon(Icons.more_horiz), SizedBox(width: 20)],
          ),
          body: CheckoutViewBody(cartList: cartList),
        );
      },
    );
  }
}
