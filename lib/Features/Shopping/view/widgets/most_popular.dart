import 'package:flutter/material.dart';
import 'package:needit_app/Features/Shopping/view/widgets/custom_sliver_grid_goods.dart';

import 'package:needit_app/constant.dart';
import 'package:needit_app/core/get_products/Domain/entity/product_entity.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({super.key, required this.allProducts});
  final List<ProductEntity> allProducts;

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 9, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    //TabController tabController = TabController(length: 5, vsync: this);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          TabBarMostPopular(
            tabController: tabController,
            allPopularcubit: widget.allProducts,
          ),
          SizedBox(
            // height:
            //     300, // حدد ارتفاعاً مناسباً أو استخدم Expanded إذا كنت داخل Column رئيسي
            child: Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  // 1. All - تعرض كل المنتجات بدون استثناء
                  _buildProductsGrid(widget.allProducts),

                  // 2. clothes - فلترة حسب النص الذي خزنته في قاعدة البيانات
                  _buildProductsGrid(
                    widget.allProducts
                        .where((p) => p.categoryID == 'Clothes')
                        .toList(),
                  ),

                  // 3. shoes
                  _buildProductsGrid(
                    widget.allProducts
                        .where((p) => p.categoryID == 'Shoes')
                        .toList(),
                  ),

                  // 4. bags
                  _buildProductsGrid(
                    widget.allProducts
                        .where((p) => p.categoryID == 'Bags')
                        .toList(),
                  ),

                  // 5. watches
                  _buildProductsGrid(
                    widget.allProducts
                        .where((p) => p.categoryID == 'Watches')
                        .toList(),
                  ),

                  // 6. jewelry
                  _buildProductsGrid(
                    widget.allProducts
                        .where((p) => p.categoryID == 'Jewelry')
                        .toList(),
                  ),

                  // 7. toys
                  _buildProductsGrid(
                    widget.allProducts
                        .where((p) => p.categoryID == 'Toys')
                        .toList(),
                  ),

                  // 8. kitchen
                  _buildProductsGrid(
                    widget.allProducts
                        .where((p) => p.categoryID == 'Kitchen')
                        .toList(),
                  ),

                  // 9. electronic
                  _buildProductsGrid(
                    widget.allProducts
                        .where((p) => p.categoryID == 'Electronics')
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ويدجيت موحدة لبناء التبويب لمنع التكرار
Widget buildTabItem(String label) {
  return Tab(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 28,

        child: Center(
          child: Text(
            label,
            softWrap: false,
            overflow: TextOverflow.visible,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ),
    ),
  );
}

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

Widget _buildProductsGrid(List<ProductEntity> products) {
  if (products.isEmpty) {
    return const Center(child: Text("No products found in this category"));
  } else {
    return CustomScrollView(
      key: PageStorageKey(products.hashCode),
      slivers: [CustomSliverGridGoods(products: products)],
    );
  }
}

List getCateList({required int imortantindex}) {
  return [];
}
