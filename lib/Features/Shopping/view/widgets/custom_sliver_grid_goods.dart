import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/product_entity_category.dart';
import 'package:needit_app/Features/product_details/views/produst_details.dart';
import 'package:needit_app/constant.dart';

class CustomSliverGridGoods extends StatelessWidget {
  const CustomSliverGridGoods({
    super.key,
    required this.clothes,
    required this.toys,
    required this.watch,
    required this.kitchen,
    required this.shoes,
    required this.jewelry,
    required this.bags,
    required this.electronic,
  });
  final List<ProductEntityCategory> clothes;
  final List<ProductEntityCategory> toys;
  final List<ProductEntityCategory> watch;
  final List<ProductEntityCategory> kitchen;
  final List<ProductEntityCategory> shoes;
  final List<ProductEntityCategory> jewelry;
  final List<ProductEntityCategory> bags;
  final List<ProductEntityCategory> electronic;
  //final DetailsEntity details;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid.builder(
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 2,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return ValueListenableBuilder(
            valueListenable: imortantindex,
            builder:
                (context, value, child) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (context) => ProductDetailsView(
                              id:
                                  getCateList(
                                    imortantindex: value.toInt(),
                                  )[index].id,
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
                                  // fit: BoxFit.contain,
                                  getCateList(
                                    imortantindex: value.toInt(),
                                  )[index].imageUrl ??
                                  'https://img.freepik.com/free-photo/forklift-boxes-arrangement_23-2149853118.jpg?t=st=1723569462~exp=1723573062~hmac=db877b441335a64500852f42152f9220ad73c496720648342b8bb2130bccbafa&w=740',
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            getCateList(
                                  imortantindex: value.toInt(),
                                )[index].name ??
                                'hoooo',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
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
                              getCateList(
                                imortantindex: value.toInt().toInt(),
                              )[index].rate.toString(),
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
                                '8.795 sold',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${getCateList(imortantindex: value.toInt())[index].totalSold} \$',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
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
          );
        },
      ),
    );
  }

  List getCateList({required int imortantindex}) {
    if (imortantindex == 1) {
      return clothes;
    } else if (imortantindex == 2) {
      return electronic;
    } else if (imortantindex == 3) {
      return bags ?? [];
    } else if (imortantindex == 4) {
      return toys;
    } else if (imortantindex == 5) {
      return jewelry;
    } else if (imortantindex == 6) {
      return kitchen;
    } else if (imortantindex == 7) {
      return watch;
    } else if (imortantindex == 7) {
      return shoes;
    }
    return clothes;
  }
}
