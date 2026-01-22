import 'package:flutter/material.dart';
import 'package:needit_app/Features/order%20details/Presentation/view/widget/order_details_view_body.dart';
import 'package:needit_app/constant.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Details',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: kRubikBold,
            fontSize: 18,
          ),
        ),
        actions: [
          Icon(Icons.more_horiz, color: Colors.black),
          SizedBox(width: 20),
        ],
      ),
      body: OrderDetailsViewBody(),
    );
  }
}
