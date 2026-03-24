import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/cart_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/cart_event.dart';

class BottomActionBar extends StatefulWidget {
  const BottomActionBar({
    super.key,
    required this.quantity,
    required this.price,
    required this.onPressed,
  });
  final num quantity;
  final num price;
  final void Function()? onPressed;

  @override
  State<BottomActionBar> createState() => _BottomActionBarState();
}

class _BottomActionBarState extends State<BottomActionBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total price",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  "\$${(widget.price * widget.quantity).toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 30),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: widget.onPressed,
                icon: const Icon(Icons.shopping_bag_outlined),
                label: const Text("Add to Cart"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
