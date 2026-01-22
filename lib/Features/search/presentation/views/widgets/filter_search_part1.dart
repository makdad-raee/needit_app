import 'package:flutter/material.dart';
import 'package:needit_app/Features/search/presentation/views/widgets/seach_field_from_filter.dart';
import 'package:needit_app/Features/search/presentation/views/widgets/search_view_filter_body.dart';
import 'package:needit_app/constant.dart';

class FilterSearchPart1 extends StatelessWidget {
  const FilterSearchPart1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchFieldFromFilter(),
        const SizedBox(height: 30),
        Row(
          children: [
            Text(
              'Results for “Electronics”',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 18,
                fontFamily: kSwiss721Bold,
              ),
            ),
            const Spacer(),
            Text(
              '65 found',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 12,
                //   color: Colors.black54,
                fontFamily: kRubikRubikRegular,
              ),
            ),
          ],
        ),
        const ResultForSearchFromFilter(),
        const ResultForSearchFromFilter(),
        const Divider(thickness: 3, color: Color(0xffEDEDED)),
        const SizedBox(height: 19),
      ],
    );
  }
}
