import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/get_products/Domain/entity/product_entity.dart';

class ProductImageHeader extends StatefulWidget {
  const ProductImageHeader({super.key, required this.product});
  final ProductEntity product;

  @override
  State<ProductImageHeader> createState() => _ProductImageHeaderState();
}

class _ProductImageHeaderState extends State<ProductImageHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.product.name,
                style: const TextStyle(fontSize: 24, fontFamily: kRubikBold),
              ),
            ),
            const Icon(Icons.favorite_border, size: 28),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "${widget.product.soldCount ?? 0} sold",
                style: const TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(width: 15),
            const Icon(Icons.star, color: Colors.amber, size: 20),
            Text(
              " ${widget.product.avRating} (${widget.product.ratingCount} reviews)",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
