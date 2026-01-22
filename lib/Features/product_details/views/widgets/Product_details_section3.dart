import 'package:flutter/material.dart';
import 'package:needit_app/Features/product_details/Domain/Entities/details_entity.dart';
import 'package:needit_app/Features/product_details/views/widgets/quantity_and_price.dart';
import 'package:needit_app/Features/product_details/views/widgets/size_and_color_select_section.dart';
import 'package:needit_app/constant.dart';

class ProductDetailsSection3 extends StatelessWidget {
  const ProductDetailsSection3({super.key, required this.detailsModel});
  final DetailsEntity detailsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 18,
              fontFamily: kSwiss721Bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            detailsModel.description,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 12,
              fontFamily: kRubikRubikRegular,
              color: Colors.black45,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 20),
          SizeAndColorSelectSection(detailsModel: detailsModel),
          const SizedBox(height: 21),
          QuantityAndPrice(detailsModel: detailsModel),
        ],
      ),
    );
  }
}
