import 'package:flutter/material.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_entity.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/widgets/product_item_for_cart.dart';
import 'package:needit_app/Features/checkout/Presentation/view/Widgets/checkout_view_body_section1.dart';
import 'package:needit_app/Features/checkout/Presentation/view/payment_methode_view.dart';
import 'package:needit_app/core/widgets/comtinue_buttom.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key, required this.cartList});
  final List<CartEntity> cartList;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CheckOutViewBodySection1()),
        SliverList.builder(
          itemCount: cartList.length,
          itemBuilder:
              (context, index) => ProductItemForCart(cartList: cartList[index]),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 57, vertical: 20),
            child: ContinueBottom(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PaymentMethodeView()),
                );
              },
              text: 'Continue to Payment',
            ),
          ),
        ),
      ],
    );
  }
}
