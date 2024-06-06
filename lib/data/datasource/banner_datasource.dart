import 'package:apple_shop/util/api_exception.dart';
import 'package:apple_shop/data/model/banner.dart';
import 'package:apple_shop/di/di.dart';
import 'package:dio/dio.dart';

abstract class IBannerDataSource {
  Future<List<BannerCampain>> getBanners();
}

class BannerRemoteDataSource extends IBannerDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<BannerCampain>> getBanners() async {
    try {
      var response = await _dio.get(
        'collections/banner/records',
      );

      return response.data['items']
          .map<BannerCampain>(
            (jsonObject) => BannerCampain.fromJson(jsonObject),
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
