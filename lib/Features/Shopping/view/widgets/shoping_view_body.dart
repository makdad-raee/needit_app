import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/main_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/offer_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/popular_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/product_entity_category.dart';
import 'package:needit_app/Features/Shopping/view/widgets/custom_appbar.dart';
import 'package:needit_app/Features/Shopping/view/widgets/custom_sliver_grid_goods.dart';
import 'package:needit_app/Features/Shopping/view/widgets/list_of_containers.dart';
import 'package:needit_app/Features/Shopping/view/widgets/offers_and_grid_view_circles_avatar.dart';
import 'package:needit_app/Features/clothes_bags_etc/presentation/bloc/bloc/products_of_category_bloc.dart';
import 'package:needit_app/Features/search/presentation/views/widgets/search_place.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/widgets/loading_widgets.dart';

class HomeViewBodyShop extends StatelessWidget {
  const HomeViewBodyShop({
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
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const CustomAppBar(),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const SearchPlace(),
                      ),
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
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              'Most Popular',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w700,
                                fontFamily: kSwiss721Bold,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'See all',
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall!.copyWith(
                                fontFamily: kRubikRubikRegular,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListOfContainers(popularEntity: popularS),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),

            BlocConsumer<ProductsOfCategoryBloc, ProductsOfCategoryState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is ProductsOfCategoryLoadingState) {
                  return const SliverToBoxAdapter(child: LoadingWidgets());
                } else if (state is ProductsOfCategoryLoadedState) {
                  return CustomSliverGridGoods(
                    bags: state.productsOfCategory,
                    clothes: state.productsOfCategory,
                    electronic: state.productsOfCategory,
                    jewelry: state.productsOfCategory,
                    kitchen: state.productsOfCategory,
                    watch: state.productsOfCategory,
                    shoes: state.productsOfCategory,
                    toys: state.productsOfCategory,
                    // bags: value,
                    // clothes: value,
                    // electronic: value,
                    // jewelry: value,
                    // kitchen: value,
                    // watch: value,
                    // shoes: value,
                    // toys: value,
                  );
                } else if (state is ProductsOfCategoryErrorState) {
                  return const SliverToBoxAdapter(
                    child: Center(child: Text('No data')),
                  );
                }
                return const SliverToBoxAdapter(child: LoadingWidgets());
              },
            ),
            //   ),
          ],
        ),
      ),
    );
  }
}
