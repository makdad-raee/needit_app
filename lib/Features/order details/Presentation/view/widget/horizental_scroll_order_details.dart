import 'package:flutter/material.dart';
import 'package:needit_app/Features/order%20details/Presentation/view/widget/horizental_item_for_order_details.dart';

class HorizentalSCrollDetailsOrder extends StatelessWidget {
  const HorizentalSCrollDetailsOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 182,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => orderDetilsItemForHorizental(index: index),
        separatorBuilder: (context, index) => SizedBox(width: 8),
        itemCount: 5,
      ),
    );
  }
}
