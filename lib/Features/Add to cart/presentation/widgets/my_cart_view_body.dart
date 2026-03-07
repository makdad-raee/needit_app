import 'package:flutter/material.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_item_entity.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/widgets/product_item_for_cart.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key, required this.myCart});
  final List<CartItemEntity> myCart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder:
                (context, index) => ProductItemForCart(cartItem: myCart[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 0),
            itemCount: myCart.length,
          ),
        ),
      ],
    );
  }
}
