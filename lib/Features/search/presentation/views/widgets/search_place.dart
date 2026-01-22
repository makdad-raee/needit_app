import 'package:flutter/material.dart';
import 'package:needit_app/Features/search/presentation/views/search_filter_view.dart';

class SearchPlace extends StatelessWidget {
  const SearchPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SearchFilterView()),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 42,
            width: MediaQuery.of(context).size.width * 0.77,
            decoration: BoxDecoration(
              color: const Color(0xffEDEDED),
              borderRadius: BorderRadius.circular(8),
              // boxShadow:  [
              //       BoxShadow(
              //           blurRadius: 6,
              //           spreadRadius: 0,
              //           color: Colors.grey.shade400,
              //           offset: Offset(0,0 ))
              //     ],
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey.withOpacity(0.8)),
                const SizedBox(width: 8),
                Text(
                  'Search',
                  style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 4),
        const Spacer(),
        GestureDetector(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => const SearchFilterView(),
            // ));
          },
          child: Container(
            height: 40,
            width: 42,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset('assets/images/slider_up.png'),
          ),
        ),
      ],
    );
  }
}
