import 'package:dartz/dartz.dart';
import 'package:needit_app/Features/Shopping/data/data%20source/shop_local_data_source.dart';
import 'package:needit_app/Features/Shopping/data/data%20source/shop_remote_data_source.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/main_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/offer_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/popular_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/product_entity_category.dart';
import 'package:needit_app/Features/Shopping/domain/Reposetories/shop_repositories.dart';
import 'package:needit_app/core/error/excpetion.dart';
import 'package:needit_app/core/error/failure.dart';
import 'package:needit_app/core/network/network_info.dart';

class ShopReposetoriesImpl implements ShopRepository {
  final ShopRemoteDataSource remoteDataSource;
  final ShopLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ShopReposetoriesImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<MainEntity>>> getAllMain() async {
    if (await networkInfo.isConnected) {
      print('==========isConnected......');
      try {
        final main = await remoteDataSource.getAllMain();
        localDataSource.cachedMain(main);
        return right(main);
      } on ServerException {
        print('==========isooooooooooooooooooo......');
        return left(ServerFaliure());
      }
    } else {
      try {
        final localMain = await localDataSource.getCachedMain();
        return right(localMain);
      } on EmptyCasheException {
        return left(EmptyCasheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<OfferEntity>>> getAllOffers() async {
    if (await networkInfo.isConnected) {
      try {
        final offer = await remoteDataSource.getAllOffer();
        localDataSource.cachedOffer(offer);
        return right(offer);
      } on ServerException {
        return left(ServerFaliure());
      }
    } else {
      try {
        final localOffer = await localDataSource.getCachedOffer();
        return right(localOffer);
      } on EmptyCasheException {
        return left(EmptyCasheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<PopularEntity>>> getAllPopular() async {
    if (await networkInfo.isConnected) {
      try {
        final popular = await remoteDataSource.getAllPopular();
        localDataSource.cachesPopular(popular);
        return right(popular);
      } on ServerException {
        return left(ServerFaliure());
      }
    } else {
      try {
        final localPopular = await localDataSource.getCachedPopular();
        return right(localPopular);
      } on EmptyCasheException {
        return left(EmptyCasheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductEntityCategory>>> getProductsOFGategory({
    required int limit,
    required int id,
  }) async {
    if (await networkInfo.isConnected) {
      print('networkInfo is cooooooooooo');
      try {
        final productsOfCategory = await remoteDataSource.getProductsOFGategory(
          limit: limit,
          id: id,
        );
        return right(productsOfCategory);
      } on ServerException {
        return left(ServerFaliure());
      }
    } else {
      try {
        final productsOfCategoryFromLocal = await localDataSource
            .getCachedProductsofCategory(id: id);
        return right(productsOfCategoryFromLocal);
      } on EmptyCasheException {
        return Left(EmptyCasheFailure());
      }
    }
  }
}
