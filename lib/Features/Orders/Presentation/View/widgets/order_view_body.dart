import 'package:flutter/material.dart';
import 'package:needit_app/Features/Orders/Domain/entity/order_entity.dart';
import 'package:needit_app/Features/Orders/Presentation/View/widgets/list_of_containers_orders.dart';
import 'package:needit_app/Features/Orders/Presentation/View/widgets/order_item.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key, required this.orders});
  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return MyOrders(orders: orders);
    //  NoOrderWidgets();
  }
}

class MyOrders extends StatelessWidget {
  const MyOrders({super.key, required this.orders});

  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // ListOfContainersORders(),
          ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return OrderItem(order: orders[index]);
            },
          ),
        ],
      ),
    );
  }
}
