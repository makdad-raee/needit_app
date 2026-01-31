import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:needit_app/Features/Account/Data/repo/create_user_from_firebase_repo_impl.dart';
import 'package:needit_app/Features/Account/Domain/repos/create_user_from_firebase_repo.dart';
import 'package:needit_app/Features/Add%20to%20cart/Data/Local/cart_local_data_source.dart';
import 'package:needit_app/Features/Add%20to%20cart/Data/Remote/cart_remote_source.dart';
import 'package:needit_app/Features/Add%20to%20cart/Data/repositories/cart_repo_impl.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Repositories/cart_reposotries.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/usecase/add_products_to_cart_usecase.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/usecase/get_all_cart_use_case.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/usecase/remove_from_cart_usecase.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/my_cart_bloc.dart';
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
import 'package:needit_app/Features/checkout/Data/checkout_remote_data_source.dart';
import 'package:needit_app/Features/checkout/Data/reposetriesPres/add_location_repo_impl.dart';
import 'package:needit_app/Features/checkout/Data/reposetriesPres/add_promo_repo_impl.dart';
import 'package:needit_app/Features/checkout/Data/reposetriesPres/add_shipping_type_repo_impl.dart';
import 'package:needit_app/Features/checkout/Domain/Repositories/add_location_repo.dart';
import 'package:needit_app/Features/checkout/Domain/Repositories/add_promo_repo.dart';
import 'package:needit_app/Features/checkout/Domain/Repositories/add_shipping_repo.dart';
import 'package:needit_app/Features/checkout/Domain/use%20case/add_location_use_case.dart';
import 'package:needit_app/Features/checkout/Domain/use%20case/add_promo_code_use_case.dart';
import 'package:needit_app/Features/checkout/Domain/use%20case/add_shipping_type_use_case.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_bloc.dart';
import 'package:needit_app/Features/clothes_bags_etc/presentation/bloc/bloc/products_of_category_bloc.dart';
import 'package:needit_app/Features/product_details/Domain/Repositories/details_repo.dart';
import 'package:needit_app/Features/product_details/Domain/Use%20case/get_details_use_case.dart';
import 'package:needit_app/Features/product_details/data/Repositories/details_repo_impl.dart';
import 'package:needit_app/Features/product_details/data/data%20source/local_data_source.dart';
import 'package:needit_app/Features/product_details/data/data%20source/remote_data_source.dart';
import 'package:needit_app/Features/product_details/presentation/bloc/details_bloc_bloc.dart';
import 'package:needit_app/Features/services/firbase_auth_service.dart';
import 'package:needit_app/Features/services/firestore_service.dart';
import 'package:needit_app/core/network/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Features
  //! bloc
  sl.registerFactory(
    () => ShopBloc(
      getAllMainUseCase: sl.call(),
      getAllOfferUseCase: sl.call(),
      getAllPopularUseCase: sl.call(),
      getProductsOfCategoryUseCase: sl.call(),
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
    () => MyCartBloc(
      getAllCartUseCase: sl.call(),
      addProductsToCartUsecase: sl.call(),
      removeFromnCartUsecase: sl.call(),
    ),
  );
  sl.registerFactory(
    () => ProductsOfCategoryBloc(getProductsOfCategoryUseCase: sl.call()),
  );
  sl.registerFactory(() => CheckoutBloc(sl.call(), sl.call(), sl.call()));
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
  sl.registerLazySingleton(() => GetAllCartUseCase(cartReposotries: sl.call()));
  sl.registerLazySingleton(
    () => AddProductsToCartUsecase(cartReposotries: sl.call()),
  );
  sl.registerLazySingleton(
    () => RemoveFromnCartUsecase(cartReposotries: sl.call()),
  );
  sl.registerLazySingleton(
    () => AddLocationUseCase(addShippingRepo: sl.call()),
  );
  sl.registerLazySingleton(
    () => AddPromoCodeUseCase(addPromoCodeRepository: sl.call()),
  );
  sl.registerLazySingleton(
    () => AddShippingTypeUseCase(addShippingRepo: sl.call()),
  );
  sl.registerLazySingleton<SignupUpWhithEmilAndpasswordUsecase>(
    () => SignupUpWhithEmilAndpasswordUsecase(authRepo: sl.call()),
  );
  sl.registerLazySingleton<LoginWhithEmilAndpasswordUsecase>(
    () => LoginWhithEmilAndpasswordUsecase(loginRepo: sl.call()),
  );

  //! repository
  sl.registerLazySingleton<ShopRepository>(
    () => ShopReposetoriesImpl(
      remoteDataSource: sl.call(),
      localDataSource: sl.call(),
      networkInfo: sl.call(),
    ),
  );
  sl.registerLazySingleton<AddShippingRepo>(
    () => AddShippingTypeRepoImpl(checkoutRemoteDataSource: sl.call()),
  );
  sl.registerLazySingleton<AddLocationRepo>(
    () => AddLocationRepoImpl(checkoutRemoteDataSource: sl.call()),
  );
  sl.registerLazySingleton<AddPromoRepo>(
    () => AddPromoRepoImpl(checkoutRemoteDataSource: sl.call()),
  );
  sl.registerLazySingleton<DetailsReposotory>(
    () => DetailsRepoImpl(
      localDataSource: sl.call(),
      networkInfo: sl.call(),
      remoteDataSource: sl.call(),
    ),
  );
  sl.registerLazySingleton<CartReposotries>(
    () => CartRepoImpl(
      cartLocalDataSource: sl.call(),
      cartRemoteSource: sl.call(),
    ),
  );
  sl.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(firbaseAuthService: FirbaseAuthService()),
  );

  sl.registerLazySingleton(
    () => AddShippingTypeRepoImpl(checkoutRemoteDataSource: sl.call()),
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
  sl.registerLazySingleton<CartRemoteSource>(
    () => CartRemoteSourceImpl(sharedPreferences: sl.call()),
  );
  sl.registerLazySingleton<CheckoutRemoteDataSource>(
    () => CheckoutRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      firbaseAuthService: FirbaseAuthService(),
      createUserFromFirebaseRepoImpl: sl.call(),
    ),
  );
  sl.registerLazySingleton<CreateUserFromFirebaseRepo>(
    () => CreateUserFromFirebaseRepoImpl(firestorService: FirestorService()),
  );

  //! core

  //! core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker: sl.call()),
  );
  //! external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
