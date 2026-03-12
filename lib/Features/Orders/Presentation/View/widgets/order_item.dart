import 'package:flutter/material.dart';
import 'package:needit_app/Features/Orders/Domain/entity/order_entity.dart';
import 'package:needit_app/Features/Orders/Presentation/View/widgets/product%20_order_item.dart';
import 'package:needit_app/Features/order%20details/Presentation/view/order_details_view.dart';
import 'package:needit_app/constant.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});
  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          // عرض رقم الطلب
          Row(
            children: [
              Text(
                "Order #${order.orderId.substring(0, 8)}", // اختصار الـ ID ليكون أجمل
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 20,
                  fontFamily: kSwiss721Bold,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Total   ${order.subTotal.toStringAsFixed(2)} \$',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                    fontFamily: kSwiss721Black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // عرض المنتجات الموجودة داخل هذا الطلب فقط
          Column(
            children:
                order.items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 21),
                    child: ProductOfOrderItem(
                      item: item,
                    ), // تمرير المنتج الحقيقي
                  );
                }).toList(),
          ),

          Row(
            children: [
              const OrderButtom(text: 'Refund', color: Color(0xffEDEDED)),
              const Spacer(),
              OrderButtom(
                // عرض حالة الطلب الحقيقية (Paid, Delivered, الخ) على الزر
                text: order.status.toUpperCase(),
                color: Theme.of(context).primaryColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (context) => OrderDetailsView(
                            order: order,
                          ), // تمرير الطلب للتفاصيل
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
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
              fontFamily: kSwiss721Black,
            ),
          ),
        ),
      ),
    );
  }
}
