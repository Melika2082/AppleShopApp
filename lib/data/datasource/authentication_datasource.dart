import 'package:apple_shop/util/api_exception.dart';
import 'package:apple_shop/di/di.dart';
import 'package:dio/dio.dart';

abstract class IAuthenticationDataSource {
  Future<void> register(
    String username,
    String password,
    String passwordConfirm,
  );

  Future<String> login(
    String username,
    String password,
  );
}

class AuthenticationRemote implements IAuthenticationDataSource {
  final Dio _dio = locator.get();

  @override
  Future<void> register(
    String username,
    String password,
    String passwordConfirm,
  ) async {
    try {
      await _dio.post(
        'collections/users/records',
        data: {
          'username': username,
          'password': password,
          'passwordConfirm': passwordConfirm,
        },
      );
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
  Future<String> login(String username, String password) async {
    try {
      var response = await _dio.post(
        'collections/users/auth-with-password',
        data: {
          'identity': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return response.data?['token'];
      }
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
    return '';
  }
}
