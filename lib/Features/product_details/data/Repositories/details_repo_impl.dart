import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/product_details/Domain/Entities/details_entity.dart';
import 'package:needit_app/Features/product_details/Domain/Repositories/details_repo.dart';
import 'package:needit_app/Features/product_details/data/data%20source/local_data_source.dart';
import 'package:needit_app/Features/product_details/data/data%20source/remote_data_source.dart';
import 'package:needit_app/core/error/excpetion.dart';
import 'package:needit_app/core/error/failure.dart';
import 'package:needit_app/core/network/network_info.dart';

class DetailsRepoImpl implements DetailsReposotory {
  final DetailsRemoteDataSource remoteDataSource;
  final DetailsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  DetailsRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, DetailsEntity>> getDetailsOfProducts({
    required int id,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final details = await remoteDataSource.getDetailsOfProducts(id: id);
        localDataSource.cashedDetails(details);
        return right(details);
      } on ServerException {
        return left(ServerFaliure(message: 'ServerFaliure'));
      }
    } else {
      try {
        final details = await localDataSource.getCashedDetails();
        return right(details);
      } on EmptyCasheException {
        return left(EmptyCasheFailure(message: 'EmptyCasheFailure'));
      }
    }
  }
}
