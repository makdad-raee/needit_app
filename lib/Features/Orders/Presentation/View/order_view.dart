import 'package:flutter/material.dart';
import 'package:needit_app/Features/Orders/Presentation/View/widgets/order_view_body.dart';
import 'package:needit_app/constant.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SizedBox(width: 20),
            Text(
              'My Orders',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: kRubikBold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: OrderViewBody(),
    );
  }
}
