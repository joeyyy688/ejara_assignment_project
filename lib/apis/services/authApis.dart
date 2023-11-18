// ignore_for_file: file_names

import 'package:ejara_assignment_project/apis/generics/httpGenericRequest.dart';
import 'package:ejara_assignment_project/apis/models/loginAuthResponse.dart';
import 'package:ejara_assignment_project/constants/app_apiConstants.dart';
import 'package:flutter/foundation.dart';

class AuthApis {
  static Future<LoginAuthResponse?> login(
    String username,
    String password,
  ) async {
    try {
      final response = await GenericRequest(
        method: RequestMethods.post,
        authApiCalls: true,
        url: AppApiConstants.loginUrl,
        body: {
          'log': username,
          'password': password,
        },
      ).makeApiCall();

      if (response.statusCode == 200) {
        return LoginAuthResponse.fromJson(response.body);
      } else {
        return LoginAuthResponse.fromJson(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
