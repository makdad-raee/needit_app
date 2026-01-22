import 'package:flutter/material.dart';
import 'package:needit_app/Features/search/presentation/views/widgets/search_view_filter_body.dart';

class SearchFilterView extends StatelessWidget {
  const SearchFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: const SearchViewFilterBody(),
        ),
      ),
    );
  }
}
