import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/main_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/popular_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/product_entity_category.dart';
import 'package:needit_app/Features/Shopping/view/widgets/two_circle_avatar_categories.dart';
import 'package:needit_app/Features/clothes_bags_etc/presentation/bloc/bloc/products_of_category_bloc.dart';
import 'package:needit_app/Features/clothes_bags_etc/views/clothes_view.dart';

class GridViewCirclesAvatarCategories extends StatelessWidget {
  const GridViewCirclesAvatarCategories({
    super.key,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TwoCrcleAvatarCategories(
          nameTop: mainEntity[0].productEntity.name!,
          namebottom: mainEntity[4].productEntity.name!,
          pathTop: mainEntity[0].productEntity.imageUrl ?? '',
          pathBottom: mainEntity[4].productEntity.imageUrl ?? '',
          onTapTop: () {
            BlocProvider.of<ProductsOfCategoryBloc>(
              context,
            ).add(GetAllProductsOfCategroyEvent(id: 8));
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (context) => CategoryViewOfmain(clothes: clothes ?? []),
              ),
            );
          },
          onTapBottom: () {
            BlocProvider.of<ProductsOfCategoryBloc>(
              context,
            ).add(GetAllProductsOfCategroyEvent(id: 12));
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (context) => CategoryViewOfmain(clothes: jewelry ?? []),
              ),
            );
          },
        ),
        TwoCrcleAvatarCategories(
          onTapTop: () {
            BlocProvider.of<ProductsOfCategoryBloc>(
              context,
            ).add(GetAllProductsOfCategroyEvent(id: 9));
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (context) => CategoryViewOfmain(clothes: electronic ?? []),
              ),
            );
          },
          onTapBottom: () {
            BlocProvider.of<ProductsOfCategoryBloc>(
              context,
            ).add(GetAllProductsOfCategroyEvent(id: 13));
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (context) => CategoryViewOfmain(clothes: kitchen ?? []),
              ),
            );
          },
          nameTop: mainEntity[1].productEntity.name!,
          namebottom: mainEntity[5].productEntity.name!,
          pathTop: mainEntity[1].productEntity.imageUrl,
          pathBottom: mainEntity[5].productEntity.imageUrl,
        ),
        TwoCrcleAvatarCategories(
          onTapBottom: () {
            BlocProvider.of<ProductsOfCategoryBloc>(
              context,
            ).add(GetAllProductsOfCategroyEvent(id: 14));
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoryViewOfmain(clothes: watch ?? []),
              ),
            );
          },
          onTapTop: () {
            BlocProvider.of<ProductsOfCategoryBloc>(
              context,
            ).add(GetAllProductsOfCategroyEvent(id: 10));
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoryViewOfmain(clothes: bags ?? []),
              ),
            );
          },
          nameTop: mainEntity[2].productEntity.name!,
          namebottom: mainEntity[6].productEntity.name!,
          pathTop: mainEntity[2].productEntity.imageUrl,
          pathBottom: mainEntity[6].productEntity.imageUrl,
        ),
        TwoCrcleAvatarCategories(
          onTapTop: () {
            BlocProvider.of<ProductsOfCategoryBloc>(
              context,
            ).add(GetAllProductsOfCategroyEvent(id: 11));
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoryViewOfmain(clothes: toys ?? []),
              ),
            );
          },
          onTapBottom: () {
            BlocProvider.of<ProductsOfCategoryBloc>(
              context,
            ).add(GetAllProductsOfCategroyEvent(id: 15));
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoryViewOfmain(clothes: shoes ?? []),
              ),
            );
          },
          nameTop: mainEntity[3].productEntity.name!,
          namebottom: mainEntity[7].productEntity.name!,
          pathTop: mainEntity[3].productEntity.imageUrl,
          pathBottom: mainEntity[7].productEntity.imageUrl,
        ),
      ],
    );
  }
}
