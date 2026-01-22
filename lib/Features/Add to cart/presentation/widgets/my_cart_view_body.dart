import 'package:flutter/material.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_entity.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/widgets/product_item_for_cart.dart';
import 'package:needit_app/Features/checkout/Presentation/view/checkout_view.dart';
import 'package:needit_app/constant.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key, required this.myCart});
  final List<CartEntity> myCart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder:
                (context, index) => ProductItemForCart(cartList: myCart[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 0),
            itemCount: myCart.length,
          ),
        ),
        myCart.isEmpty
            ? const Center(child: Text(''))
            : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Total Price',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                          fontFamily: kRubikRubikRegular,
                          color: Colors.black45,
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: cartentityNotifer,
                        builder:
                            (context, value, child) => Text(
                              ' ${((value.map((e) => e.totalPRice).reduce((value, element) => value + element))).toStringAsFixed(2)}\$',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                fontSize: 22,
                                fontFamily: kRubikBold,
                              ),
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CheckoutView(cartList: myCart),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadiusDirectional.circular(8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Checkout',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontSize: 15, fontFamily: kRubikBold),
                          ),
                          Icon(
                            Icons.arrow_right_alt,
                            color: Colors.black,
                            weight: 500,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        const SizedBox(height: 20),
      ],
    );
  }
}
