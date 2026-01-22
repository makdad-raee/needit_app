import 'package:flutter/material.dart';
import 'package:needit_app/Features/checkout/Presentation/view/Widgets/payment_methode_view_body.dart';
import 'package:needit_app/constant.dart';

class PaymentMethodeView extends StatelessWidget {
  const PaymentMethodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Methods',
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
      body: PaymentMethodeViewBody(),
    );
  }
}
