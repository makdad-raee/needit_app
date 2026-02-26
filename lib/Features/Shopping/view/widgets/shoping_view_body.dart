import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/main_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/offer_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/popular_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/product_entity_category.dart';
import 'package:needit_app/Features/Shopping/view/widgets/custom_appbar.dart';
import 'package:needit_app/Features/Shopping/view/widgets/most_popular.dart';
import 'package:needit_app/Features/Shopping/view/widgets/offers_and_grid_view_circles_avatar.dart';
import 'package:needit_app/Features/search/presentation/views/widgets/search_place.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/get_products/presentation/bloc/get_products_bloc.dart';
import 'package:needit_app/core/get_products/presentation/bloc/get_products_bloc_state.dart';
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
      child: NestedScrollView(
        // الجزء العلوي الذي يختفي عند السكرول (Appbar, Search, Offers)
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CustomAppBar(),
                  ),
                  const SizedBox(height: 40),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SearchPlace(),
                  ),
                  const SizedBox(height: 16),
                  OffersAndGridViewCircleAvatar(
                    oofersEn: offerS,
                    mainEntity: mainS,

                    popularS: popularS,
                    clothes: clothes,
                    toys: toys,
                    watch: watch,
                    kitchen: kitchen,
                    shoes: shoes,
                    jewelry: jewelry,
                    bags: bags,
                    electronic: electronic,
                  ),
                  const SizedBox(height: 24),
                  _buildMostPopularHeader(context),
                ],
              ),
            ),
          ];
        },
        // الجزء السفلي الذي يحتوي على الـ TabBar والمنتجات
        body: BlocBuilder<GetProductsBloc, GetProductsState>(
          builder: (context, state) {
            if (state is GetProductsLoading) return const LoadingWidgets();
            if (state is GetProductsSuccessState) {
              // الآن MostPopular ستكون هي الـ Body وتتحكم بالسكرول الخاص بها
              return MostPopular(allProducts: state.products);
            }
            return const Center(child: Text('Error loading products'));
          },
        ),
      ),
    );
  }
}

Widget _buildMostPopularHeader(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      children: [
        Text(
          'Most Popular',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w700,
            fontFamily: kSwiss721Bold,
          ),
        ),
        const Spacer(),
        Text(
          'See all',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontFamily: kRubikRubikRegular,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
