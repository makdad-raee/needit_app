import 'package:flutter/material.dart';
import 'package:needit_app/Features/Shopping/view/widgets/function/tab_bar_function.dart';
import 'package:needit_app/Features/Shopping/view/widgets/tab_bar_most_popular.dart';
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
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: TabBarMostPopular(
            tabController: tabController,
            allPopularcubit: widget.allProducts,
          ),
        ),

        const SizedBox(height: 12),

        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              _buildScrollableGrid(widget.allProducts, "all"),
              _buildScrollableGrid(
                widget.allProducts
                    .where((p) => p.categoryID == 'Clothes')
                    .toList(),
                "clothes",
              ),
              _buildScrollableGrid(
                widget.allProducts
                    .where((p) => p.categoryID == 'Shoes')
                    .toList(),
                "shoes",
              ),
              _buildScrollableGrid(
                widget.allProducts
                    .where((p) => p.categoryID == 'Bags')
                    .toList(),
                "bags",
              ),
              _buildScrollableGrid(
                widget.allProducts
                    .where((p) => p.categoryID == 'Watches')
                    .toList(),
                "watches",
              ),
              _buildScrollableGrid(
                widget.allProducts
                    .where((p) => p.categoryID == 'Jewelry')
                    .toList(),
                "jewelry",
              ),
              _buildScrollableGrid(
                widget.allProducts
                    .where((p) => p.categoryID == 'Toys')
                    .toList(),
                "toys",
              ),
              _buildScrollableGrid(
                widget.allProducts
                    .where((p) => p.categoryID == 'Kitchen')
                    .toList(),
                "kitchen",
              ),
              _buildScrollableGrid(
                widget.allProducts
                    .where((p) => p.categoryID == 'Electronics')
                    .toList(),
                "electronics",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScrollableGrid(List<ProductEntity> products, String key) {
    if (products.isEmpty) {
      return const Center(child: Text("No products found"));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),

      child: buildProductsGrid(products),
    );
  }
}
