import 'package:flutter/material.dart';
import 'package:needit_app/Features/Orders/Presentation/View/widgets/list_of_containers_orders.dart';
import 'package:needit_app/Features/Orders/Presentation/View/widgets/order_item.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MyOrders();
    //  NoOrderWidgets();
  }
}

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [ListOfContainersORders(), OrderItem()]),
    );
  }
}
