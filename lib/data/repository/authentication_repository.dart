import 'package:apple_shop/data/datasource/authentication_datasource.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:apple_shop/util/auth_manager.dart';
import 'package:apple_shop/di/di.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<String, String>> register(
    String username,
    String password,
    String passwordConfirm,
  );

  Future<Either<String, String>> login(
    String username,
    String password,
  );
}

class AuthenticationRepository extends IAuthRepository {
  final IAuthenticationDataSource _datasource = locator.get();

  @override
  Future<Either<String, String>> register(
    String username,
    String password,
    String passwordConfirm,
  ) async {
    try {
      await _datasource.register(
        'Saray',
        '87654321',
        '87654321',
      );
      return right('!ثبت نام انجام شد');
    } on ApiException catch (ex) {
      return left(ex.message ?? 'اتصال به اینترنت برقرار نیست');
    }
  }

  @override
  Future<Either<String, String>> login(
    String username,
    String password,
  ) async {
    try {
      String token = await _datasource.login(
        username,
        password,
      );
      if (token.isNotEmpty) {
        AuthManager.saveToken(token);
        return right('.شما با موفقیت وارد شدید');
      } else {
        return left('خطا در هنگام ورود به حساب کاربر');
      }
    } on ApiException catch (ex) {
      return left('${ex.message}');
    }
  }
}
