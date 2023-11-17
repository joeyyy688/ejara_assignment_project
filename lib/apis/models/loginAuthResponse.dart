// ignore_for_file: file_names

import 'dart:convert';

class LoginAuthResponse {
  final String responsecode;
  final String message;
  final String token;
  final String refreshToken;
  final String tokenType;

  LoginAuthResponse({
    required this.responsecode,
    required this.message,
    required this.token,
    required this.refreshToken,
    required this.tokenType,
  });

  factory LoginAuthResponse.fromRawJson(String str) =>
      LoginAuthResponse.fromJson(json.decode(str));

  factory LoginAuthResponse.fromJson(Map<String, dynamic> json) =>
      LoginAuthResponse(
        responsecode: json['responsecode'] ?? '',
        message: json['message'] ?? '',
        token: json['token'] ?? '',
        refreshToken: json['refresh_token'] ?? '',
        tokenType: json['token_type'] ?? '',
      );
}
