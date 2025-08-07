import 'package:get_it/get_it.dart';
import 'package:homecenter/features/products/data/datasources/local/cart_local_datasource.dart';
import 'package:homecenter/features/products/data/datasources/remote/dio_datasource.dart';
import 'package:homecenter/features/products/data/datasources/remote/products_remote_datasource.dart';
import 'package:homecenter/features/products/data/repositories/cart_repository_impl.dart';
import 'package:homecenter/features/products/data/repositories/products_repository_impl.dart';
import 'package:homecenter/features/products/domain/repositories/cart_repository.dart';
import 'package:homecenter/features/products/domain/repositories/products_repository.dart';
import 'package:homecenter/features/products/domain/usecases/get_products.dart';
import 'package:homecenter/features/products/domain/usecases/get_products_cart.dart';
import 'package:homecenter/features/products/domain/usecases/remove_product_cart.dart';
import 'package:homecenter/features/products/presentation/bloc/cart/cart_bloc.dart';
import 'package:homecenter/features/products/presentation/bloc/productsList/products_list_bloc.dart';
import "package:homecenter/features/products/domain/usecases/add_product_cart.dart"
    as addProductUseCases;

/// Get It instance
final GetIt sl = GetIt.instance;

/// Init dependency injection
Future<void> init() async {
  // ! Core
  sl.registerLazySingleton(
    () => DioDatasource.createDio("https://www.homecenter.com.co/s/search/v1"),
  );

  // ! cart

  // DataSources
  sl.registerLazySingleton<CartLocalDatabase>(
    () => CartLocalDatabase(),
  );

  // Repository
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(cartLocalDatabase: sl()),
  );

  // UseCases
  sl.registerLazySingleton(
    () => addProductUseCases.AddProductToCart(repository: sl()),
  );
  sl.registerLazySingleton(() => GetCartProducts(repository: sl()));
  sl.registerLazySingleton(() => RemoveProductFromCart(repository: sl()));

  // BLoC
  sl.registerFactory(
    () => CartBloc(
      addProductToCart: sl(),
      getCart: sl(),
      removeProductFromCart: sl(),
    ),
  );

  // ! Products

  // DataSources
  sl.registerLazySingleton<ProductsRemoteDatasource>(
    () => ProductsRemoteDatasource(
      dio: sl(),
      baseUrl: "https://www.homecenter.com.co/s/search/v1",
    ),
  );

  // Repository
  sl.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(sl()),
  );

  // UseCases
  sl.registerLazySingleton(() => GetProducts(repository: sl()));

  // BLoC
  sl.registerFactory(() => ProductsListBloc(sl()));
}
