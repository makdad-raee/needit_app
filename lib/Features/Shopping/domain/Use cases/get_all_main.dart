import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/main_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Reposetories/shop_repositories.dart';
import 'package:needit_app/core/error/failure.dart';

class GetAllMainUseCase {
  final ShopRepository repository;

  GetAllMainUseCase({required this.repository});

  Future<Either<Failure, List<MainEntity>>> call() async {
    return await repository.getAllMain();
  }
}
