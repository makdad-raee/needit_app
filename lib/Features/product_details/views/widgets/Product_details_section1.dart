import 'package:flutter/material.dart';
import 'package:needit_app/Features/product_details/Domain/Entities/details_entity.dart';
import 'package:needit_app/Features/product_details/views/widgets/image_and_indicator.dart';

class ProductDetailsSection1 extends StatelessWidget {
  const ProductDetailsSection1({super.key, required this.detailsModel});
  final DetailsEntity detailsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.46,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Color(0xffD9D9D9)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 22),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          Positioned(
            //left: MediaQuery.of(context).size.width ,
            bottom: 0,
            child: ImageAndIndicator(detailsModel: detailsModel),
          ),
        ],
      ),
    );
  }
}
