import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/offer_entity.dart';
import 'package:needit_app/constant.dart';

class OffersItem extends StatelessWidget {
  const OffersItem({super.key, required this.offer});

  final OfferEntity offer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            const SizedBox(height: 24),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: Colors.grey.shade400,
                    offset: Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(24),
                color: Color(0xffEDEDED),
              ),
              child: Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color(0xffbace7e7e7),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 29,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${offer.productEntity.discount!.toString()} % ',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 28,
                          fontFamily: kSwiss721Bold,
                        ),
                      ),
                      Text(
                        offer.productEntity.name!,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontFamily: kSwiss721Bold,
                        ),
                      ),
                      Text(
                        offer.productEntity.description!,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 10,
                          fontFamily: kRubikRubikRegular,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          right: 6,
          top: -5,
          child: CachedNetworkImage(
            height: 180,
            width: 200,
            maxWidthDiskCache: 200,
            maxHeightDiskCache: 250,
            imageUrl: offer.productEntity.imageUrl ?? '',
          ),
        ),
      ],
    );
  }
}
