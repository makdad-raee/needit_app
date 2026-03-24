import 'package:flutter/material.dart';

class QuantitySection extends StatefulWidget {
  const QuantitySection({super.key, required this.onChanged});
  final Function(int) onChanged;

  @override
  State<QuantitySection> createState() => _QuantitySectionState();
}

class _QuantitySectionState extends State<QuantitySection> {
  int quantity = 1;
  // الكمية الافتراضية
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Quantity",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 20),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove, size: 20),
                onPressed: () {
                  if (quantity > 1) setState(() => quantity--);
                  widget.onChanged(quantity);
                },
              ),
              Text(
                '$quantity',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add, size: 20),
                onPressed: () {
                  setState(() => quantity++);
                  widget.onChanged(quantity);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
