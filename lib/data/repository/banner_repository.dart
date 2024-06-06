import 'package:apple_shop/data/datasource/banner_datasource.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:apple_shop/data/model/banner.dart';
import 'package:apple_shop/di/di.dart';
import 'package:dartz/dartz.dart';

abstract class IBannerRepository {
  Future<Either<String, List<BannerCampain>>> getBanners();
}

class BannerRepository extends IBannerRepository {
  final IBannerDataSource _dataSource = locator.get();

  @override
  Future<Either<String, List<BannerCampain>>> getBanners() async {
    try {
      var response = await _dataSource.getBanners();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'اتصال به اینترنت برقرار نیست');
    }
  }
}
