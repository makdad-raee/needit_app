import 'package:flutter/material.dart';
import 'package:needit_app/Features/Orders/Presentation/View/widgets/product%20_order_item.dart';
import 'package:needit_app/Features/order%20details/Presentation/view/order_details_view.dart';
import 'package:needit_app/constant.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(height: 30),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Order #860123',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 20,
                  fontFamily: kSwiss721Bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            ProductOfOrderItem(),
            SizedBox(height: 21),
            ProductOfOrderItem(),
            SizedBox(height: 21),
            Row(
              children: [
                OrderButtom(text: 'Refund', color: Color(0xffEDEDED)),
                Spacer(),
                OrderButtom(
                  text: 'Details',
                  color: Theme.of(context).primaryColor,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => OrderDetailsView(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class OrderButtom extends StatelessWidget {
  const OrderButtom({
    super.key,
    required this.text,
    required this.color,
    this.onTap,
  });
  final String text;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width * 0.43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 12,
              fontFamily: kSwiss721Bold,
            ),
          ),
        ),
      ),
    );
  }
}
