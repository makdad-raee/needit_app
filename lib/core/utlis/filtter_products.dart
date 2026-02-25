import 'package:needit_app/core/get_products/Domain/entity/product_entity.dart';

List<ProductEntity> filterProductsByCategory(
  String category,
  List<ProductEntity> allProducts,
) {
  List<ProductEntity> filteredProducts =
      allProducts.where((product) {
        return product.categoryID == category;
      }).toList();
  return filteredProducts;
}
