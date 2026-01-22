import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/popular_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Reposetories/shop_repositories.dart';
import 'package:needit_app/core/error/failure.dart';

class GetAllPopularUseCase {
  final ShopRepository repository;

  GetAllPopularUseCase({required this.repository});
  Future<Either<Failure, List<PopularEntity>>> call() async {
    return await repository.getAllPopular();
  }
}
