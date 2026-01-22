import 'package:flutter/material.dart';
import 'package:needit_app/Features/product_details/Domain/Entities/details_entity.dart';
import 'package:needit_app/Features/product_details/views/widgets/product_details_section1.dart';
import 'package:needit_app/Features/product_details/views/widgets/product_details_section2.dart';
import 'package:needit_app/Features/product_details/views/widgets/product_details_section3.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.detailsModel});
  final DetailsEntity detailsModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductDetailsSection1(detailsModel: detailsModel),
          ProductDetailsSection2(detailsModel: detailsModel),
          ProductDetailsSection3(detailsModel: detailsModel),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
