import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_item_entity.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/widgets/product_item_for_cart.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_bloc.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_event.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_state.dart';
import 'package:needit_app/Features/checkout/Presentation/view/Widgets/checkout_view_body_section1.dart';
import 'package:needit_app/core/widgets/comtinue_buttom.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key, required this.cartList});
  final List<CartItemEntity> cartList;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CheckOutViewBodySection1()),
        SliverList.builder(
          itemCount: cartList.length,
          itemBuilder:
              (context, index) => ProductItemForCart(cartItem: cartList[index]),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 57, vertical: 20),
            child: BlocBuilder<CheckoutBloc, CheckoutState>(
              builder:
                  (context, state) => ContinueBottom(
                    onTap: () {
                      log(
                        "Confirm Order Tapped with address: ${state.selectedAddress?.title} and shipping method: ${state.selectedShippingMethod?.name}",
                      );
                      log(
                        "Current User ID: ${FirebaseAuth.instance.currentUser?.uid}",
                      );
                      final String? currentUserId =
                          FirebaseAuth.instance.currentUser?.uid;
                      if (state.selectedAddress != null &&
                          state.selectedShippingMethod != null &&
                          currentUserId != null) {
                        context.read<CheckoutBloc>().add(
                          ConfirmOrderEvent(
                            userId:
                                currentUserId, // هنا تضع الـ ID الحقيقي لاحقاً
                            cartItems: cartList,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Please select address and shipping method first",
                            ),
                          ),
                        );
                      }
                    },
                    text: 'Confirm Order',
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
