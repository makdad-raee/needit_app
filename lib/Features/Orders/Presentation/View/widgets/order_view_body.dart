import 'package:flutter/material.dart';
import 'package:needit_app/Features/Orders/Domain/entity/order_entity.dart';
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

// In deinem OrderViewBody
class MyOrders extends StatefulWidget {
  final List<OrderEntity> orders;
  const MyOrders({super.key, required this.orders});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  String selectedFilter = 'All'; // Standardmäßig alle anzeigen

  @override
  Widget build(BuildContext context) {
    // Hier filtern wir die Liste basierend auf dem Status
    final filteredOrders =
        selectedFilter == 'All'
            ? widget.orders
            : widget.orders
                .where((o) => o.status == selectedFilter.toLowerCase())
                .toList();

    return Column(
      children: [
        // 1. Die Filter-Leiste (wie im Figma Design)
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                ['All', 'Paid', 'Delivered', 'Cancelled'].map((filter) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ChoiceChip(
                      label: Text(filter),
                      selected: selectedFilter == filter,
                      selectedColor:
                          Theme.of(
                            context,
                          ).primaryColor, // Deine gelbe Farbe aus der Constant
                      onSelected: (bool selected) {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                    ),
                  );
                }).toList(),
          ),
        ),

        // 2. Die Liste der gefilterten Bestellungen
        Expanded(
          child: ListView.builder(
            itemCount: filteredOrders.length,
            itemBuilder:
                (context, index) => OrderItem(order: filteredOrders[index]),
          ),
        ),
      ],
    );
  }
}
