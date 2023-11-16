// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:ejara_assignment_project/Utilities/userAuthSecureStorage.dart';
import 'package:flutter/material.dart';

import '../../constants/app_apiConstants.dart';
import '../models/genericResponse.dart';

class GenericRequest {
  const GenericRequest({
    required this.method,
    required this.url,
    required this.authApiCalls,
    this.body,
  });

  final RequestMethods method;
  final String url;
  final Map<String, dynamic>? body;
  final bool authApiCalls;

  Future<GenericResponse> makeApiCall() async {
    try {
      final header = <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'api-key': AppApiConstants.apiKey,
        'client-id': AppApiConstants.clientId,
        'app-version': AppApiConstants.appVersion,
        'app-platform': AppApiConstants.appPlatform,
        'client': AppApiConstants.client,
        'Accept-language': 'en',
      };

      if (!authApiCalls) {
        final authToken = await UserAuthSecureStorage.getUserAuthToken();
        header['authorization'] = 'Bearer $authToken';
      }

      final dio = Dio();
      final uri = Uri.parse(url);
      late Response response;

      // Adding Retry Interceptor
      // Add the interceptor
      dio.interceptors.add(
        RetryInterceptor(
          dio: dio,
          logPrint: debugPrint, // specify log function (optional)
          retries: 15, // retry count (optional)
          retryDelays: const [
            // set delays between retries (optional)
            Duration(seconds: 5),
            Duration(seconds: 10),
            Duration(seconds: 15),
            Duration(seconds: 20),
            Duration(seconds: 30),
            Duration(seconds: 50),
            Duration(seconds: 70),
            Duration(seconds: 100),
            Duration(seconds: 130),
            Duration(seconds: 160),
            Duration(seconds: 200),
            Duration(seconds: 300),
            Duration(seconds: 400),
            Duration(seconds: 500),
            Duration(seconds: 600),
          ],
        ),
      );

      switch (method) {
        case RequestMethods.get:
          response = await dio.get(
            uri.toString(),
            queryParameters: body,
            options: Options(
              headers: header,
              validateStatus: (_) => true,
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json,
            ),
          );
          break;
        case RequestMethods.post:
          response = await dio.post(
            uri.toString(),
            data: body,
            options: Options(
              headers: header,
              validateStatus: (_) => true,
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json,
            ),
          );
          break;
        case RequestMethods.put:
          response = await dio.put(
            uri.toString(),
            data: body,
            options: Options(
              headers: header,
              validateStatus: (_) => true,
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json,
            ),
          );
          break;
        case RequestMethods.patch:
          response = await dio.patch(
            uri.toString(),
            data: body,
            options: Options(
              headers: header,
              validateStatus: (_) => true,
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json,
            ),
          );
          break;

        case RequestMethods.delete:
          response = await dio.delete(
            uri.toString(),
            data: body,
            options: Options(
              headers: header,
              validateStatus: (_) => true,
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json,
            ),
          );
          break;
      }
      return GenericResponse(
        isError: false,
        statusCode: response.statusCode!,
        body: response.data,
      );
    } on DioException catch (e) {
      return GenericResponse(
        isError: true,
        statusCode: e.response?.statusCode ?? 500,
        body: e.response?.data,
      );
    }
  }
}
