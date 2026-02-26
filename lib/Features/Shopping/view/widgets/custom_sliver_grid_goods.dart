import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:needit_app/constant.dart';
import 'package:needit_app/core/get_products/Domain/entity/product_entity.dart';

class CustomSliverGridGoods extends StatelessWidget {
  const CustomSliverGridGoods({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
      sliver: SliverGrid.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 2,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder:
              //         (context) => ProductDetailsView(
              //           id:
              //               getCateList(
              //                 imortantindex: value.toInt(),
              //               )[index].id,
              //         ),
              //   ),
              // );
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
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6,
                          spreadRadius: 0,
                          color: Colors.grey.shade400,
                          offset: Offset(0, 0),
                        ),
                      ],
                      color: const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            products[index].imageUrl ??
                            "https://img.freepik.com/free-photo/forklift-boxes-arrangement_23-2149853118.jpg?t=st=1723569462~exp=1723573062~hmac=db877b441335a64500852f42152f9220ad73c496720648342b8bb2130bccbafa&w=740",

                        // fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      products[index].name ?? 'hoooo',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontFamily: kRubikRubikMedium,
                        fontWeight: FontWeight.w500,
                      ),
                      //maxLines: 1,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star_half),
                      Text(
                        products[index].ratingCount.toString() ?? "4.5",
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 2,
                          height: 10,
                          decoration: const BoxDecoration(color: kprimaryColor),
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
                          products[index].avRating.toString() ?? '8.795 sold',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '33\$',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      fontFamily: kSwiss721Bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
