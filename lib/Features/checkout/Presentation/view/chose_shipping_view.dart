import 'package:flutter/material.dart';
import 'package:needit_app/Features/checkout/Presentation/view/Widgets/choose_view_body.dart';
import 'package:needit_app/constant.dart';

class ChoseShippingView extends StatelessWidget {
  const ChoseShippingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose Shipping',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: kRubikRubikMedium,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
      ),
      body: ChooseViewBody(),
    );
  }
}
