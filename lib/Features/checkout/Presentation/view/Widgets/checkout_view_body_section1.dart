import 'package:flutter/material.dart';
import 'package:needit_app/Features/checkout/Presentation/view/Widgets/ammount_shipping_total.dart';
import 'package:needit_app/Features/checkout/Presentation/view/Widgets/checkout_location.dart';
import 'package:needit_app/Features/checkout/Presentation/view/Widgets/checkout_shiping_type.dart';
import 'package:needit_app/Features/checkout/Presentation/view/Widgets/promo_code.dart';
import 'package:needit_app/Features/checkout/Presentation/view/chose_shipping_view.dart';
import 'package:needit_app/constant.dart';

class CheckOutViewBodySection1 extends StatelessWidget {
  const CheckOutViewBodySection1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CheckoutLocation(),
          SizedBox(height: 18),
          Text(
            'Choose Shipping',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontFamily: kRubikBold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 18),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ChoseShippingView()),
              );
            },
            child: CheckoutShipingType(),
          ),
          SizedBox(height: 18),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Parent’s House',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: kRubikBold,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 18),
          Text(
            'Promo Code',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontFamily: kRubikBold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 18),
          PromoCode(),
          SizedBox(height: 40),
          AmmountShippingTotal(),
          SizedBox(height: 40),
          Divider(thickness: 1, color: Color(0xffEDEDED)),
          SizedBox(height: 24),
          Text(
            'Order List',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontFamily: kRubikBold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 18),
        ],
      ),
    );
  }
}
