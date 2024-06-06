import 'package:apple_shop/data/model/product.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:apple_shop/di/di.dart';
import 'package:dio/dio.dart';

abstract class IProductDataSource {
  Future<List<Product>> getProducts();
  Future<List<Product>> getHotest();
  Future<List<Product>> getBestSeller();
}

class ProductRemoteDatasource extends IProductDataSource {
  final Dio _dio = locator.get();

  @override
  Future<List<Product>> getProducts() async {
    try {
      var response = await _dio.get(
        'collections/products/records',
      );

      return response.data['items']
          .map<Product>(
            (jsonObject) => Product.fromJson(jsonObject),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(
        code: ex.response?.statusCode,
        message: ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        code: 0,
        message: 'Unknown error',
      );
    }
  }

  @override
  Future<List<Product>> getHotest() async {
    try {
      Map<String, String> qParams = {
        'filter': 'popularity="Hotest"',
      };

      var response = await _dio.get(
        'collections/products/records',
        queryParameters: qParams,
      );

      return response.data['items']
          .map<Product>(
            (jsonObject) => Product.fromJson(jsonObject),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(
        code: ex.response?.statusCode,
        message: ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        code: 0,
        message: 'Unknown error',
      );
    }
  }

  @override
  Future<List<Product>> getBestSeller() async {
    try {
      Map<String, String> qParams = {
        'filter': 'popularity="Best Seller"',
      };

      var response = await _dio.get(
        'collections/products/records',
        queryParameters: qParams,
      );

      return response.data['items']
          .map<Product>(
            (jsonObject) => Product.fromJson(jsonObject),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(
        code: ex.response?.statusCode,
        message: ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        code: 0,
        message: 'Unknown error',
      );
    }
  }
}
