import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/product_entity_category.dart';
import 'package:needit_app/Features/clothes_bags_etc/presentation/bloc/bloc/products_of_category_bloc.dart';
import 'package:needit_app/Features/product_details/views/produst_details.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/widgets/loading_widgets.dart';
import 'package:text_scroll/text_scroll.dart';

class CategoryViewOfmainBody extends StatelessWidget {
  const CategoryViewOfmainBody({super.key, required this.clothes});
  final List<ProductEntityCategory> clothes;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsOfCategoryBloc, ProductsOfCategoryState>(
      builder: (context, state) {
        if (state is ProductsOfCategoryLoadingState) {
          return const LoadingWidgets();
        } else if (state is ProductsOfCategoryLoadedState) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GridView.builder(
              itemCount: state.productsOfCategory.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                childAspectRatio: 0.7,
                //  mainAxisSpacing: 10
              ),
              itemBuilder:
                  (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (context) => ProductDetailsView(
                                id: state.productsOfCategory[index].id,
                              ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 160,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(17),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  offset: Offset(0, 0),
                                  color: Colors.grey.shade400,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(17),
                              child: CachedNetworkImage(
                                fit: BoxFit.contain,
                                imageUrl:
                                    state.productsOfCategory[index].imageUrl ??
                                    'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                              ),
                            ),
                          ),
                          TextScroll(
                            state.productsOfCategory[index].name ?? 'Clothes',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: kRubikRubikMedium,
                            ),
                            // maxLines: 1,
                            // overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star_half),
                              Text(
                                state.productsOfCategory[index].rate
                                        .toString() ??
                                    '4.5',
                                style: Theme.of(context).textTheme.bodySmall!
                                    .copyWith(fontFamily: kRubikRubikRegular),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: 2,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    color: kprimaryColor,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xffE7E7E7),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  '${state.productsOfCategory[index].totalSold.toString()} sold',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall!.copyWith(
                                    fontSize: 10,
                                    fontFamily: kRubikRubikRegular,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            ' \$458.00',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              fontFamily: kSwiss721Bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
          );
        } else if (state is ProductsOfCategoryErrorState) {
          const Center(child: Text(' Error pleas check your connection'));
        }
        return const LoadingWidgets();
      },
    );
  }
}
