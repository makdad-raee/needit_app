// ويدجيت موحدة لبناء التبويب لمنع التكرار
import 'package:flutter/material.dart';
import 'package:needit_app/Features/Shopping/view/widgets/custom_sliver_grid_goods.dart';
import 'package:needit_app/core/get_products/Domain/entity/product_entity.dart';

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

Widget buildProductsGrid(List<ProductEntity> products) {
  if (products.isEmpty) {
    return const Center(child: Text("No products found in this category"));
  } else {
    return CustomScrollView(
      key: PageStorageKey(products.hashCode),
      slivers: [CustomSliverGridGoods(products: products)],
    );
  }
}
