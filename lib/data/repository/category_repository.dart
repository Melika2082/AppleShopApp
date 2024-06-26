import 'package:apple_shop/data/datasource/category_datasource.dart';
import 'package:apple_shop/data/model/category.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:apple_shop/di/di.dart';
import 'package:dartz/dartz.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<Category>>> getCategories();
}

class CategoryRepository extends ICategoryRepository {
  final ICategoryDataSource _dataSource = locator.get();

  @override
  Future<Either<String, List<Category>>> getCategories() async {
    try {
      var response = await _dataSource.getCategories();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'اتصال به اینترنت برقرار نیست');
    }
  }
}
