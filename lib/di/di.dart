import 'package:apple_shop/data/datasource/authentication_datasource.dart';
import 'package:apple_shop/data/datasource/product_detail_datasource.dart';
import 'package:apple_shop/data/repository/authentication_repository.dart';
import 'package:apple_shop/data/repository/product_detail_repository.dart';
import 'package:apple_shop/data/datasource/category_datasource.dart';
import 'package:apple_shop/data/repository/category_repository.dart';
import 'package:apple_shop/data/datasource/product_datasource.dart';
import 'package:apple_shop/data/repository/product_repository.dart';
import 'package:apple_shop/data/datasource/banner_datasource.dart';
import 'package:apple_shop/data/repository/banner_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

var locator = GetIt.instance;

Future<void> getItInite() async {
  //Components
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'https://startflutter.ir/api/',
      ),
    ),
  );

  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  // Datasources
  locator.registerFactory<IAuthenticationDataSource>(
    () => AuthenticationRemote(),
  );
  locator.registerFactory<ICategoryDataSource>(
    () => CategoryRemoteDataSource(),
  );
  locator.registerFactory<IBannerDataSource>(
    () => BannerRemoteDataSource(),
  );
  locator.registerFactory<IProductDataSource>(
    () => ProductRemoteDatasource(),
  );
  locator.registerFactory<IDetailProductDataSource>(
    () => DetailProductRemoteDataSource(),
  );

  //Repositories
  locator.registerFactory<IAuthRepository>(
    () => AuthenticationRepository(),
  );
  locator.registerFactory<ICategoryRepository>(
    () => CategoryRepository(),
  );
  locator.registerFactory<IBannerRepository>(
    () => BannerRepository(),
  );
  locator.registerFactory<IProductRepository>(
    () => ProductRepository(),
  );
  locator.registerFactory<IDetailProductRepository>(
    () => DetailProductRepository(),
  );
}
