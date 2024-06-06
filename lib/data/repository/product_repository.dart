import 'package:apple_shop/data/datasource/product_datasource.dart';
import 'package:apple_shop/data/model/product.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:apple_shop/di/di.dart';
import 'package:dartz/dartz.dart';

abstract class IProductRepository {
  Future<Either<String, List<Product>>> getProducts();
  Future<Either<String, List<Product>>> getHotest();
  Future<Either<String, List<Product>>> getBestSeller();
}

class ProductRepository extends IProductRepository {
  final IProductDataSource _dataSource = locator.get();

  @override
  Future<Either<String, List<Product>>> getProducts() async {
    try {
      var response = await _dataSource.getProducts();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'اتصال به اینترنت برقرار نیست');
    }
  }

  @override
  Future<Either<String, List<Product>>> getHotest() async {
    try {
      var response = await _dataSource.getHotest();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'اتصال به اینترنت برقرار نیست');
    }
  }

  @override
  Future<Either<String, List<Product>>> getBestSeller() async {
    try {
      var response = await _dataSource.getBestSeller();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'اتصال به اینترنت برقرار نیست');
    }
  }
}
