import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/product_details/Domain/Entities/details_entity.dart';
import 'package:needit_app/Features/product_details/Domain/Repositories/details_repo.dart';
import 'package:needit_app/core/error/failure.dart';

class GetDetailsUseCase {
  final DetailsReposotory detailsReposotory;
  GetDetailsUseCase({required this.detailsReposotory});
  Future<Either<Failure, DetailsEntity>> call({required int id}) async {
    return await detailsReposotory.getDetailsOfProducts(id: id);
  }
}
