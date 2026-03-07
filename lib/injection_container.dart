import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:needit_app/Features/Account/Data/repo/create_user_from_firebase_repo_impl.dart';
import 'package:needit_app/Features/Account/Domain/repos/create_user_from_firebase_repo.dart';
import 'package:needit_app/Features/Add%20to%20cart/Data/Local/cart_local_data_source.dart';

import 'package:needit_app/Features/Add%20to%20cart/Data/repositories/cart_repo_impl.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Repositories/cart_reposotries.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/usecase/cache_cart_use_case.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/usecase/get_cashed_cart_use_case.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/cart_bloc.dart';
import 'package:needit_app/Features/Auth/Data/repos/auth_repo_impl.dart';
import 'package:needit_app/Features/Auth/Domain/Repos/auth_repo.dart';
import 'package:needit_app/Features/Auth/Domain/use%20cases/signup_usecase.dart';
import 'package:needit_app/Features/Auth/presentation/bloc/signup_bloc.dart';
import 'package:needit_app/Features/Login/Data/repo/login_repo_impl.dart';
import 'package:needit_app/Features/Login/Domain/Repos/login_repo.dart';
import 'package:needit_app/Features/Login/Domain/usecase/login_use_case.dart';
import 'package:needit_app/Features/Login/Presentation/Bloc/login_bloc.dart';
import 'package:needit_app/Features/Shopping/data/data%20source/shop_local_data_source.dart';
import 'package:needit_app/Features/Shopping/data/data%20source/shop_remote_data_source.dart';
import 'package:needit_app/Features/Shopping/data/reposetries/shop_reposetories_impl.dart';
import 'package:needit_app/Features/Shopping/domain/Reposetories/shop_repositories.dart';
import 'package:needit_app/Features/Shopping/domain/Use%20cases/get_all_main.dart';
import 'package:needit_app/Features/Shopping/domain/Use%20cases/get_all_offers.dart';
import 'package:needit_app/Features/Shopping/domain/Use%20cases/get_all_popular.dart';
import 'package:needit_app/Features/Shopping/domain/Use%20cases/get_products_of_category.dart';
import 'package:needit_app/Features/Shopping/presentaion/bloc/Shop%20bloc/shop_bloc.dart';

import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_bloc.dart';
import 'package:needit_app/Features/clothes_bags_etc/presentation/bloc/bloc/products_of_category_bloc.dart';
import 'package:needit_app/Features/product_details/Domain/Repositories/details_repo.dart';
import 'package:needit_app/Features/product_details/Domain/Use%20case/get_details_use_case.dart';
import 'package:needit_app/Features/product_details/data/Repositories/details_repo_impl.dart';
import 'package:needit_app/Features/product_details/data/data%20source/local_data_source.dart';
import 'package:needit_app/Features/product_details/data/data%20source/remote_data_source.dart';
import 'package:needit_app/Features/product_details/presentation/bloc/details_bloc_bloc.dart';
import 'package:needit_app/Features/services/database_service.dart';
import 'package:needit_app/Features/services/firbase_auth_service.dart';
import 'package:needit_app/Features/services/firestore_service.dart';
import 'package:needit_app/core/Auth%20Bloc/auth_bloc.dart';
import 'package:needit_app/core/get_products/Domain/repos/product_repo.dart';
import 'package:needit_app/core/get_products/Domain/repos/products_repo_impl.dart';
import 'package:needit_app/core/get_products/Domain/usecase/get_products_use_case.dart';
import 'package:needit_app/core/get_products/presentation/bloc/get_products_bloc.dart';
import 'package:needit_app/core/network/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Features
  //! bloc
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      authRepo: sl.call(),
      createUserFromFirebaseRepo: sl.call(),
      loginRepo: sl.call(),
    ),
  );
  sl.registerFactory(() => GetProductsBloc(getProductsUseCase: sl.call()));
  sl.registerFactory(
    () => ShopBloc(
      getAllMainUseCase: sl.call(),
      getAllOfferUseCase: sl.call(),
      getAllPopularUseCase: sl.call(),
      getProductsOfCategoryUseCase: sl.call(),
    ),
  );
  sl.registerLazySingleton(
    () => FirebaseFirestore.instanceFor(
      app: Firebase.app(),
      databaseId: '(default)',
    ),
  );
  sl.registerFactory<SignupBloc>(
    () => SignupBloc(signupUpWhithEmilAndpasswordUsecase: sl.call()),
  );
  sl.registerFactory(
    () => LoginBloc(loginWhithEmilAndpasswordUsecase: sl.call()),
  );
  sl.registerFactory(() => DetailsBlocBloc(getDetailsUseCase: sl.call()));
  sl.registerFactory(
    () =>
        CartBloc(cacheCartUseCase: sl.call(), getCachedCartUseCase: sl.call()),
  );
  sl.registerFactory(
    () => ProductsOfCategoryBloc(getProductsOfCategoryUseCase: sl.call()),
  );
  // sl.registerFactory(() => CheckoutBloc(sl.call(), sl.call(), sl.call()));
  //! usecases
  sl.registerLazySingleton(() => GetAllMainUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetAllOffersUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetAllPopularUseCase(repository: sl.call()));
  sl.registerLazySingleton(
    () => GetProductsOfCategoryUseCase(repository: sl.call()),
  );
  sl.registerLazySingleton(
    () => GetDetailsUseCase(detailsReposotory: sl.call()),
  );
  sl.registerLazySingleton(
    () => GetCachedCartUseCase(cartReposotries: sl.call()),
  );
  sl.registerLazySingleton(() => CacheCartUseCase(cartRepositories: sl.call()));

  sl.registerLazySingleton<SignupUpWhithEmilAndpasswordUsecase>(
    () => SignupUpWhithEmilAndpasswordUsecase(authRepo: sl.call()),
  );
  sl.registerLazySingleton<LoginWhithEmilAndpasswordUsecase>(
    () => LoginWhithEmilAndpasswordUsecase(loginRepo: sl.call()),
  );
  sl.registerLazySingleton(() => GetProductsUseCase(productRepo: sl.call()));

  //! repository
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      firbaseAuthService: FirbaseAuthService(),
      createUserFromFirebaseRepo: sl.call(),
    ),
  );
  sl.registerLazySingleton<ShopRepository>(
    () => ShopReposetoriesImpl(
      remoteDataSource: sl.call(),
      localDataSource: sl.call(),
      networkInfo: sl.call(),
    ),
  );

  sl.registerLazySingleton<DetailsReposotory>(
    () => DetailsRepoImpl(
      localDataSource: sl.call(),
      networkInfo: sl.call(),
      remoteDataSource: sl.call(),
    ),
  );
  sl.registerLazySingleton<CartRepositories>(
    () => CartRepoImpl(
      cartLocalDataSource: sl.call(),
      cartRemoteDataSource: sl.call(),
    ),
  );
  sl.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(firbaseAuthService: FirbaseAuthService(), sl.call()),
  );

  sl.registerLazySingleton<ProductRepo>(
    () => ProductsRepoImpl(dataBaseService: sl.call()),
  );
  //! data source
  sl.registerLazySingleton<ShopLocalDataSource>(
    () => ShopLocalDataSourceImpl(sharedPreferences: sl.call()),
  );
  sl.registerLazySingleton<ShopRemoteDataSource>(
    () => ShopRemoteDataSourceIml(),
  );

  sl.registerLazySingleton<DetailsRemoteDataSource>(
    () => DetailsRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<DetailsLocalDataSource>(
    () => DetailsLocalDataSourceImpl(sharedPreferences: sl.call()),
  );
  sl.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSourceImpl(sharedPreferences: sl.call()),
  );

  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirestorService>(() => FirestorService());
  sl.registerLazySingleton<DataBaseService>(() => FirestorService());

  sl.registerLazySingleton<CreateUserFromFirebaseRepo>(
    () => CreateUserFromFirebaseRepoImpl(firestorService: sl.call()),
  );

  //! core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker: sl.call()),
  );
  //! external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
