import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';

class ListOfContainersORders extends StatefulWidget {
  const ListOfContainersORders({
    super.key,
    //required this.popularEntity,
  });
  // final List<PopularEntity> popularEntity;

  @override
  State<ListOfContainersORders> createState() => _ListOfContainersORdersState();
}

class _ListOfContainersORdersState extends State<ListOfContainersORders> {
  List isBlack = [true, false, false, false, false, false, false, false, false];
  List<String> allColors = ["All", "Paid", "Delivered", "Cancelled"];
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
          // widget.popularEntity.isNotEmpty
          //     ?
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemCount: 4,
              // widget.popularEntity.length,
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

                      // imortantindex.value = index + 1;
                      // print(imortantindex.value);
                      // setState(() {});
                      // if (widget.popularEntity[index].productEntity.id == 8) {
                      //   BlocProvider.of<ProductsOfCategoryBloc>(context)
                      //       .add(GetAllProductsOfCategroyEvent(id: 8));
                      //   // BlocProvider.of<ShopBloc>(context)
                      //   //     .add(GetAllClothesEvent());
                      // } else if (widget
                      //         .popularEntity[index].productEntity.id ==
                      //     9) {
                      //   BlocProvider.of<ProductsOfCategoryBloc>(context)
                      //       .add(GetAllProductsOfCategroyEvent(id: 9));
                      //   // BlocProvider.of<ShopBloc>(context)
                      //   //     .add(GetAllElectronicsEvent());
                      // } else if (widget
                      //         .popularEntity[index].productEntity.id ==
                      //     10) {
                      //   BlocProvider.of<ProductsOfCategoryBloc>(context)
                      //       .add(GetAllProductsOfCategroyEvent(id: 10));
                      //   // BlocProvider.of<ShopBloc>(context)
                      //   //     .add(GetAllBagsEvent());
                      // } else if (widget
                      //         .popularEntity[index].productEntity.id ==
                      //     11) {
                      //   BlocProvider.of<ProductsOfCategoryBloc>(context)
                      //       .add(GetAllProductsOfCategroyEvent(id: 11));
                      //   // BlocProvider.of<ShopBloc>(context)
                      //   //     .add(GetAllToysEvent());
                      // } else if (widget
                      //         .popularEntity[index].productEntity.id ==
                      //     12) {
                      //   BlocProvider.of<ProductsOfCategoryBloc>(context)
                      //       .add(GetAllProductsOfCategroyEvent(id: 12));
                      //   // BlocProvider.of<ShopBloc>(context)
                      //   //     .add(GetAllJwelryEvent());
                      // } else if (widget
                      //         .popularEntity[index].productEntity.id ==
                      //     13) {
                      //   BlocProvider.of<ProductsOfCategoryBloc>(context)
                      //       .add(GetAllProductsOfCategroyEvent(id: 13));
                      //   // BlocProvider.of<ShopBloc>(context)
                      //   //     .add(GetAllKitchenEvent());
                      // } else if (widget
                      //         .popularEntity[index].productEntity.id ==
                      //     14) {
                      //   BlocProvider.of<ProductsOfCategoryBloc>(context)
                      //       .add(GetAllProductsOfCategroyEvent(id: 14));
                      //   // BlocProvider.of<ShopBloc>(context)
                      //   //     .add(GetAllWatchEvent());
                      // } else if (widget
                      //         .popularEntity[index].productEntity.id ==
                      //     15) {
                      //   BlocProvider.of<ProductsOfCategoryBloc>(context)
                      //       .add(GetAllProductsOfCategroyEvent(id: 15));
                      //   // BlocProvider.of<ShopBloc>(context)
                      //   //     .add(GetAllShoesEvent());
                      // }

                      // // MainViewCubit.get(context).getProductsCategories(
                      // //   id: widget.popularEntity[index].productEntity.id,
                      // //   limit: 20,
                      // // );
                      changeColor(index);
                    },
                    child: Container(
                      width: 90,
                      // padding:
                      //     const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: kprimaryColor),
                        color:
                            isBlack[index]
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(18),
                      ),
                      child: Center(
                        child: Text(
                          allColors[index],
                          //widget.popularEntity[index].productEntity.name!,
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
          ),
          // : const Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }
}
