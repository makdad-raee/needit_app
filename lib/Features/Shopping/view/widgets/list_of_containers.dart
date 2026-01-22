import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/popular_entity.dart';
import 'package:needit_app/Features/clothes_bags_etc/presentation/bloc/bloc/products_of_category_bloc.dart';
import 'package:needit_app/constant.dart';

class ListOfContainers extends StatefulWidget {
  const ListOfContainers({super.key, required this.popularEntity});
  final List<PopularEntity> popularEntity;

  @override
  State<ListOfContainers> createState() => _ListOfContainersState();
}

class _ListOfContainersState extends State<ListOfContainers> {
  List isBlack = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  bool isAll = true;
  void changeAllColor() {
    setState(() {
      isAll = false;
    });
  }

  void changeColor(int index) {
    setState(() {
      for (int i = 0; i < isBlack.length; i++) {
        isBlack[i] = i == index;
      }
    });
    changeAllColor();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isAll = true;
                isBlack = List.filled(isBlack.length, false);
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: kprimaryColor),
                color: isAll ? Theme.of(context).primaryColor : Colors.white,
                borderRadius: BorderRadiusDirectional.circular(18),
              ),
              child: Center(
                child: Text(
                  "All",
                  style:
                      isAll
                          ? Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: kRubikRubikMedium,
                          )
                          : Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: kRubikRubikMedium,
                          ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          widget.popularEntity.isNotEmpty
              ? Expanded(
                child: ListView.separated(
                  separatorBuilder:
                      (context, index) => const SizedBox(width: 8),
                  itemCount: widget.popularEntity.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {});
                          // BlocProvider.of<ShopBloc>(context)
                          //     .add(GetAllClothesEvent());
                          if (productsEntityNotifer.value.isEmpty) {
                            setState(() {});
                          }

                          imortantindex.value = index + 1;
                          print(imortantindex.value);
                          setState(() {});
                          if (widget.popularEntity[index].productEntity.id ==
                              8) {
                            BlocProvider.of<ProductsOfCategoryBloc>(
                              context,
                            ).add(GetAllProductsOfCategroyEvent(id: 8));
                            // BlocProvider.of<ShopBloc>(context)
                            //     .add(GetAllClothesEvent());
                          } else if (widget
                                  .popularEntity[index]
                                  .productEntity
                                  .id ==
                              9) {
                            BlocProvider.of<ProductsOfCategoryBloc>(
                              context,
                            ).add(GetAllProductsOfCategroyEvent(id: 9));
                            // BlocProvider.of<ShopBloc>(context)
                            //     .add(GetAllElectronicsEvent());
                          } else if (widget
                                  .popularEntity[index]
                                  .productEntity
                                  .id ==
                              10) {
                            BlocProvider.of<ProductsOfCategoryBloc>(
                              context,
                            ).add(GetAllProductsOfCategroyEvent(id: 10));
                            // BlocProvider.of<ShopBloc>(context)
                            //     .add(GetAllBagsEvent());
                          } else if (widget
                                  .popularEntity[index]
                                  .productEntity
                                  .id ==
                              11) {
                            BlocProvider.of<ProductsOfCategoryBloc>(
                              context,
                            ).add(GetAllProductsOfCategroyEvent(id: 11));
                            // BlocProvider.of<ShopBloc>(context)
                            //     .add(GetAllToysEvent());
                          } else if (widget
                                  .popularEntity[index]
                                  .productEntity
                                  .id ==
                              12) {
                            BlocProvider.of<ProductsOfCategoryBloc>(
                              context,
                            ).add(GetAllProductsOfCategroyEvent(id: 12));
                            // BlocProvider.of<ShopBloc>(context)
                            //     .add(GetAllJwelryEvent());
                          } else if (widget
                                  .popularEntity[index]
                                  .productEntity
                                  .id ==
                              13) {
                            BlocProvider.of<ProductsOfCategoryBloc>(
                              context,
                            ).add(GetAllProductsOfCategroyEvent(id: 13));
                            // BlocProvider.of<ShopBloc>(context)
                            //     .add(GetAllKitchenEvent());
                          } else if (widget
                                  .popularEntity[index]
                                  .productEntity
                                  .id ==
                              14) {
                            BlocProvider.of<ProductsOfCategoryBloc>(
                              context,
                            ).add(GetAllProductsOfCategroyEvent(id: 14));
                            // BlocProvider.of<ShopBloc>(context)
                            //     .add(GetAllWatchEvent());
                          } else if (widget
                                  .popularEntity[index]
                                  .productEntity
                                  .id ==
                              15) {
                            BlocProvider.of<ProductsOfCategoryBloc>(
                              context,
                            ).add(GetAllProductsOfCategroyEvent(id: 15));
                            // BlocProvider.of<ShopBloc>(context)
                            //     .add(GetAllShoesEvent());
                          }

                          // MainViewCubit.get(context).getProductsCategories(
                          //   id: widget.popularEntity[index].productEntity.id,
                          //   limit: 20,
                          // );
                          changeColor(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.5,
                              color: kprimaryColor,
                            ),
                            color:
                                isBlack[index]
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                            borderRadius: BorderRadiusDirectional.circular(18),
                          ),
                          child: Center(
                            child: Text(
                              widget.popularEntity[index].productEntity.name!,
                              style:
                                  isBlack[index]
                                      ? Theme.of(
                                        context,
                                      ).textTheme.bodySmall!.copyWith(
                                        color: Colors.black,
                                        fontFamily: kRubikRubikMedium,
                                        fontWeight: FontWeight.w500,
                                      )
                                      : Theme.of(
                                        context,
                                      ).textTheme.bodySmall!.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: kRubikRubikMedium,
                                      ),
                            ),
                          ),
                        ),
                      ),
                ),
              )
              : const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
