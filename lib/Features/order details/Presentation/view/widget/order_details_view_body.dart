import 'package:flutter/material.dart';
import 'package:needit_app/Features/order%20details/Presentation/view/widget/horizental_scroll_order_details.dart';
import 'package:needit_app/Features/order%20details/Presentation/view/widget/order_details_status.dart';
import 'package:needit_app/Features/order%20details/Presentation/view/widget/order_price_details.dart';
import 'package:needit_app/constant.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: CustomScrollView(
        slivers: [SliverToBoxAdapter(child: ORderdetailsSection1())],
      ),
    );
  }
}

class ORderdetailsSection1 extends StatelessWidget {
  const ORderdetailsSection1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HorizentalSCrollDetailsOrder(),
        Text(
          'Order #860123',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: kRubikRubikMedium,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 15),
        orderPriceDetails(),
        SizedBox(height: 32),
        Divider(thickness: 0.6, color: Color(0xff9F9F9F)),
        SizedBox(height: 23),
        OrderDetailsStatus(),
      ],
    );
  }
}
