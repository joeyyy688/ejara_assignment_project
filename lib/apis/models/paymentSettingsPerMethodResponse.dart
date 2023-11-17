// ignore_for_file: file_names

import 'dart:convert';

class PaymentSettingsPerMethodResponse {
  final String responseCode;
  final String message;
  final List<dynamic> data;

  PaymentSettingsPerMethodResponse({
    required this.responseCode,
    required this.message,
    required this.data,
  });

  factory PaymentSettingsPerMethodResponse.fromRawJson(String str) =>
      PaymentSettingsPerMethodResponse.fromJson(json.decode(str));

  factory PaymentSettingsPerMethodResponse.fromJson(
          Map<String, dynamic> json) =>
      PaymentSettingsPerMethodResponse(
        responseCode: json['responseCode'],
        message: json['message'],
        data: List<dynamic>.from(json['data'].map((x) => x)),
      );
}
