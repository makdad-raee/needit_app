import 'package:flutter/material.dart';
import 'package:needit_app/Features/Shopping/view/widgets/search_field.dart';
import 'package:needit_app/constant.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          SearchField(),
          SizedBox(height: 14),
          Row(
            children: [
              Text('Recent', style: ktextStyle18),
              Spacer(),
              Text('clear All', style: ktextStyle12w500),
            ],
          ),
          SizedBox(height: 16),
          Diveder(),
          ListRecentSearch(),
        ],
      ),
    );
  }
}

class Diveder extends StatelessWidget {
  const Diveder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: MediaQuery.of(context).size.width,
      color: Colors.black26,
    );
  }
}

class ListRecentSearch extends StatelessWidget {
  const ListRecentSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemCount: 15,
        itemBuilder:
            (context, index) => SizedBox(
              height: 50,
              child: Row(
                children: [
                  Text(
                    'Snake Skin Bag',
                    style: ktextStyle16.copyWith(fontWeight: FontWeight.w300),
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 10,
                      child: Icon(Icons.close, size: 10),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
