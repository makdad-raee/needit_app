import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:needit_app/Features/search/presentation/views/widgets/filter_search_part1.dart';
import 'package:needit_app/constant.dart';

class SearchViewFilterBody extends StatelessWidget {
  const SearchViewFilterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(children: [FilterSearchPart1()]),
          ),
          SliverGrid.builder(
            itemCount: 2,
            // ignore: prefer_const_constructors
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 2,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) => const ResultItemForSearch(),
          ),
        ],
      ),
    );
  }
}

class ResultForSearchFromFilter extends StatelessWidget {
  const ResultForSearchFromFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Snake Skin Bag',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: kRubikRubikRegular,
            color: Colors.black38,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        Text(
          '65',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 16,
            fontFamily: kRubikRubikRegular,
            color: Colors.black45,
          ),
        ),
      ],
    );
  }
}

class ResultItemForSearch extends StatelessWidget {
  const ResultItemForSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => ProductDetailsView(
        //       id: getCateList(imortantindex: value.toInt())[index].id),
        // ));
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(17)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(17),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      // fit: BoxFit.contain,
                      //  getCateList(imortantindex: value.toInt())[index]
                      //.imageUrl ??
                      'https://img.freepik.com/free-photo/forklift-boxes-arrangement_23-2149853118.jpg?t=st=1723569462~exp=1723573062~hmac=db877b441335a64500852f42152f9220ad73c496720648342b8bb2130bccbafa&w=740',
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                //  getCateList(imortantindex: value.toInt())[index].name ??
                'hoooo',
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
                  '4.52',
                  // getCateList(imortantindex: value.toInt().toInt())[index]
                  //     .rate
                  //     .toString(),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    fontFamily: kRubikRubikRegular,
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
                    '8.795 sold',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 10,
                      fontFamily: kRubikRubikRegular,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "1292 \$",
              //   '${getCateList(imortantindex: value.toInt())[index].totalSold} \$',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 16,
                fontFamily: kSwiss721Bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
