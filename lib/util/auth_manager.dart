import 'package:shared_preferences/shared_preferences.dart';
import 'package:apple_shop/di/di.dart';
import 'package:flutter/material.dart';

class AuthManager {
  static final ValueNotifier<String?> authChangeNotifire = ValueNotifier(null);
  static final SharedPreferences _sharedPreferences = locator.get();

  static void saveToken(String token) async {
    _sharedPreferences.setString(
      'access_token',
      token,
    );
    authChangeNotifire.value = token;
  }

  static String readAuth() {
    return _sharedPreferences.getString('access_token') ?? '';
  }

  static void logOut() {
    _sharedPreferences.clear();
    authChangeNotifire.value = null;
  }

  static bool isLogedIn() {
    String token = readAuth();
    return token.isNotEmpty;
  }
}
