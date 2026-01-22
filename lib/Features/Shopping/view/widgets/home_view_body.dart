import 'package:flutter/material.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/main_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/offer_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/popular_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/product_entity_category.dart';
import 'package:needit_app/Features/Shopping/view/widgets/custom_appbar.dart';
import 'package:needit_app/Features/Shopping/view/widgets/custom_sliver_grid_goods.dart';
import 'package:needit_app/Features/Shopping/view/widgets/list_of_containers.dart';
import 'package:needit_app/Features/Shopping/view/widgets/offers_and_grid_view_circles_avatar.dart';
import 'package:needit_app/Features/Shopping/view/widgets/postioned_circle_from_rtt.dart';
import 'package:needit_app/Features/search/presentation/views/widgets/search_place.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.mainS,
    required this.offerS,
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
  final List<MainEntity> mainS;
  final List<OfferEntity> offerS;
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
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(
                  children: [
                    const PostiondCirclesFromRt(),
                    const PostiondCirclesFromcenter(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 37,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomAppBar(),
                          const SizedBox(height: 40),
                          const SearchPlace(),
                          const SizedBox(height: 16),
                          OffersAndGridViewCircleAvatar(
                            oofersEn: offerS,
                            mainEntity: mainS,
                            bags: bags ?? [],
                            clothes: clothes ?? [],
                            electronic: electronic ?? [],
                            jewelry: jewelry ?? [],
                            kitchen: kitchen ?? [],
                            shoes: shoes ?? [],
                            toys: toys ?? [],
                            watch: watch ?? [],
                            popularS: popularS,
                          ),
                          const SizedBox(height: 30),
                          const SizedBox(height: 22),
                          ListOfContainers(popularEntity: popularS),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomSliverGridGoods(
            //    imortantindex: imortantindex,
            bags: bags ?? [],
            clothes: clothes ?? [],
            electronic: electronic ?? [],
            jewelry: jewelry ?? [],
            kitchen: kitchen ?? [],
            shoes: shoes ?? [],
            toys: toys ?? [],
            watch: watch ?? [],
            //   detailsMode: cubit.details[0],
          ),
        ],
      ),
    );
  }
}
