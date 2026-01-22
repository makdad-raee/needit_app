import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:needit_app/Features/product_details/Domain/Entities/details_entity.dart';
import 'package:needit_app/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageAndIndicator extends StatelessWidget {
  const ImageAndIndicator({super.key, required this.detailsModel});
  final DetailsEntity detailsModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl:
                detailsModel.imageUrl ??
                'https://img.freepik.com/free-photo/forklift-boxes-arrangement_23-2149853118.jpg?t=st=1723569462~exp=1723573062~hmac=db877b441335a64500852f42152f9220ad73c496720648342b8bb2130bccbafa&w=740',
            height: MediaQuery.of(context).size.height * 0.46,
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.45,
          bottom: MediaQuery.of(context).size.height * 0.03,
          child: SmoothPageIndicator(
            controller: PageController(),
            count: 4,
            effect: const ExpandingDotsEffect(
              dotHeight: 6,
              dotWidth: 6,
              spacing: 3,
              expansionFactor: 3,
              activeDotColor: kprimaryColor,
              dotColor: Colors.white,
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.04,
          top: MediaQuery.of(context).size.width * 0.1,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
      ],
    );
  }
}
