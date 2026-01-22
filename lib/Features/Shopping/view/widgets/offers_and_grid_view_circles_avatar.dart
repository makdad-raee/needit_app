import 'package:flutter/material.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/main_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/offer_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/popular_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/product_entity_category.dart';
import 'package:needit_app/Features/Shopping/view/widgets/grid_view_circles_avatar_categeries.dart';

import 'special_offers.dart';

class OffersAndGridViewCircleAvatar extends StatelessWidget {
  const OffersAndGridViewCircleAvatar({
    super.key,
    required this.oofersEn,
    required this.mainEntity,
    required this.popularS,
    this.clothes,
    this.toys,
    this.watch,
    this.kitchen,
    this.shoes,
    this.jewelry,
    this.bags,
    this.electronic,
  });
  final List<OfferEntity> oofersEn;
  final List<MainEntity> mainEntity;
  final List<PopularEntity> popularS;
  //final List<ProductEntityCategory>? productS;
  final List<ProductEntityCategory>? clothes;
  final List<ProductEntityCategory>? toys;
  final List<ProductEntityCategory>? watch;
  final List<ProductEntityCategory>? kitchen;
  final List<ProductEntityCategory>? shoes;
  final List<ProductEntityCategory>? jewelry;
  final List<ProductEntityCategory>? bags;
  final List<ProductEntityCategory>? electronic;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      //  fit: StackFit.loose,
      children: [
        //  const PostiondCirclesFromlt(),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => SeeAllOffersView(offers: oofersEn),
                // ));
              },
              child: SpecialOffers(offer: oofersEn),
            ),
            const SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridViewCirclesAvatarCategories(
                bags: bags ?? [],
                clothes: clothes ?? [],
                electronic: electronic ?? [],
                jewelry: jewelry ?? [],
                kitchen: kitchen ?? [],
                shoes: shoes ?? [],
                toys: toys ?? [],
                watch: watch ?? [],
                popularS: popularS,
                mainEntity: mainEntity,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
