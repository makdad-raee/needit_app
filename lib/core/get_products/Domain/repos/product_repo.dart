import 'package:needit_app/core/get_products/Domain/entity/product_entity.dart';

abstract class ProductRepo {
  Future<List<ProductEntity>> getBestSellingProducts();
  Future<List<ProductEntity>> getProducts();
}
