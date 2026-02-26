import 'package:flutter/material.dart';
import 'package:needit_app/Features/Shopping/view/widgets/function/tab_bar_function.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/get_products/Domain/entity/product_entity.dart';

class TabBarMostPopular extends StatelessWidget {
  const TabBarMostPopular({
    super.key,
    required this.tabController,
    required this.allPopularcubit,
  });

  final TabController tabController;
  final List<ProductEntity> allPopularcubit;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: const EdgeInsets.all(0),
      controller: tabController,

      isScrollable: true,

      indicatorSize: TabBarIndicatorSize.tab,

      tabAlignment: TabAlignment.start,
      labelPadding: const EdgeInsets.symmetric(horizontal: 14),
      labelColor: kprimaryColor,
      unselectedLabelColor: Colors.white,
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      dividerColor: Colors.white,
      indicator: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: kprimaryColor, width: 1),
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).primaryColor, // اللون الأصفر عند الضغط
      ),
      tabs: [
        buildTabItem('All'),
        buildTabItem('clothes'),
        buildTabItem('shoes'),
        buildTabItem('bags'),
        buildTabItem('watches'),
        buildTabItem('jewelry'),
        buildTabItem('toys'),
        buildTabItem('kitchen'),
        buildTabItem('electronic'),
      ],
    );
  }
}
