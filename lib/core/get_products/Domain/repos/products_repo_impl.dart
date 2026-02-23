import 'package:needit_app/Features/services/database_service.dart';
import 'package:needit_app/core/get_products/Domain/entity/product_entity.dart';
import 'package:needit_app/core/get_products/data/models/product_model.dart';
import 'package:needit_app/core/get_products/Domain/repos/product_repo.dart';
import 'package:needit_app/core/utlis/backend_endpoints.dart';

class ProductsRepoImpl implements ProductRepo {
  final DataBaseService dataBaseService;
  ProductsRepoImpl({required this.dataBaseService});
  @override
  Future<List<ProductEntity>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }

  @override
  Future<List<ProductEntity>> getProducts() async {
    var data =
        await dataBaseService.getData(
              path: BackendEndpoints.getProductsEndPoint,
            )
            as List<Map<String, dynamic>>;
    List<ProductModel> products =
        data.map((e) => ProductModel.fromMap(e)).toList();
    return products;
  }
}
