// ignore_for_file: file_names

import 'dart:convert';

class PaymentMethodsResponse {
  final String responseCode;
  final String message;
  final List<Data> data;

  PaymentMethodsResponse({
    required this.responseCode,
    required this.message,
    required this.data,
  });

  factory PaymentMethodsResponse.fromRawJson(String str) =>
      PaymentMethodsResponse.fromJson(json.decode(str));

  factory PaymentMethodsResponse.fromJson(Map<String, dynamic> json) =>
      PaymentMethodsResponse(
        responseCode: json['responseCode'],
        message: json['message'],
        data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
      );
}

class Data {
  final int id;
  final String code;
  final String titleEn;
  final String titleFr;
  final String descriptionEn;
  final int minAmount;
  final String descriptionFr;
  final String iconImage;

  Data({
    required this.id,
    required this.code,
    required this.titleEn,
    required this.titleFr,
    required this.descriptionEn,
    required this.minAmount,
    required this.descriptionFr,
    required this.iconImage,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'],
        code: json['code'],
        titleEn: json['title_en'],
        titleFr: json['title_fr'],
        descriptionEn: json['description_en'],
        minAmount: json['min_amount'],
        descriptionFr: json['description_fr'],
        iconImage: json['icon_image'],
      );
}
