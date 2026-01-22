import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_entity.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/my_cart_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/widgets/cart_item_delete.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/widgets/custom_bottom_delete.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/widgets/product_item_for_cart.dart';
import 'package:needit_app/constant.dart';

class BottomsheetWidgetForDelete extends StatelessWidget {
  const BottomsheetWidgetForDelete({
    super.key,
    required this.productItemForCart,
    required this.cartList,
  });

  final ProductItemForCart productItemForCart;
  final CartEntity cartList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        //  color: Colors.red,
        height: MediaQuery.of(context).size.height * 0.36,
        child: Column(
          children: [
            SizedBox(height: 12),
            Text(
              'Remove from cart ?',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: kRubikBold,
                fontSize: 18,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(color: Colors.grey, thickness: 1),
            ),
            const SizedBox(height: 8),
            CardItemDelete(cartList: cartList),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Divider(color: Colors.grey, thickness: 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButtonForDelete(
                  text: 'Cancel',
                  textColor: Color(0xff060709),
                  color: Color(0xffEDEDED),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(width: 12),
                CustomButtonForDelete(
                  color: Theme.of(context).primaryColor,
                  text: 'Yes, Remove',
                  textColor: Colors.black,
                  onPressed: () {
                    BlocProvider.of<MyCartBloc>(context).add(
                      RemoveFromCartEvent(
                        id: productItemForCart.cartList.id,
                        cartEntity: productItemForCart.cartList,
                      ),
                    );
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
