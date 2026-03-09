import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_item_entity.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/cart_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/cart_event.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_bloc.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_event.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_state.dart';
import 'package:needit_app/Features/checkout/Presentation/view/Widgets/checkout_view_body.dart';
import 'package:needit_app/constant.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({
    super.key,
    required this.cartList,
    required this.subTotal,
  });
  final List<CartItemEntity> cartList;
  final double subTotal;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  void initState() {
    super.initState();
    // إرسال السعر الابتدائي للـ Bloc ليقوم بحساباته (العناوين، الشحن، إلخ)
    context.read<CheckoutBloc>().add(LoadCheckoutInitialData(widget.subTotal));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutBloc, CheckoutState>(
      listener: (context, state) {
        if (state.isOrderSuccess) {
          context.read<CartBloc>().add(ClearCartEvent());
          Navigator.pushReplacementNamed(context, '/ordersSuccessView');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Order Placed Successfully!")),
          );
        }
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
      },
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
            elevation: 0,
            actions: const [Icon(Icons.more_horiz), SizedBox(width: 20)],
          ),
          body: Stack(
            // أضفنا Stack لإظهار LoadingIndicator
            children: [
              CheckoutViewBody(cartList: widget.cartList),
              if (state.isLoading)
                const Center(child: CircularProgressIndicator()),
            ],
          ),
        );
      },
    );
  }
}
