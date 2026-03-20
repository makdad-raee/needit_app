import 'package:flutter/material.dart';
import 'package:needit_app/core/get_products/Domain/entity/product_entity.dart';

class ProductTitleAndRating extends StatelessWidget {
  const ProductTitleAndRating({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Description",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          product.description,
          style: TextStyle(color: Colors.grey[600], height: 1.5),
        ),
      ],
    );
  }
}
