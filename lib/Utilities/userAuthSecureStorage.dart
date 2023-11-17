// ignore_for_file: file_names

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserAuthSecureStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyUserAuthToken = 'userAuthToken';

  static Future<void> setUserAuthToken(String token) async {
    return await _storage.write(key: _keyUserAuthToken, value: token);
  }

  static Future<String?> getUserAuthToken() async {
    return await _storage.read(key: _keyUserAuthToken);
  }

  static Future<void> removeAuthToken() async {
    return await _storage.delete(key: _keyUserAuthToken);
  }
}
