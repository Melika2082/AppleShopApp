import 'package:apple_shop/data/model/category.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:apple_shop/di/di.dart';
import 'package:dio/dio.dart';

abstract class ICategoryDataSource {
  Future<List<Category>> getCategories();
}

class CategoryRemoteDataSource extends ICategoryDataSource {
  final Dio _dio = locator.get();

  @override
  Future<List<Category>> getCategories() async {
    try {
      var response = await _dio.get(
        'collections/category/records',
      );

      return response.data['items']
          .map<Category>(
            (jsonObject) => Category.fromMapJson(jsonObject),
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
