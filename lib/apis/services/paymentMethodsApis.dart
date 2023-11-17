// ignore_for_file: file_names

import 'package:ejara_assignment_project/apis/generics/httpGenericRequest.dart';
import 'package:ejara_assignment_project/apis/models/paymentMethodsResponse.dart';
import 'package:ejara_assignment_project/apis/models/paymentSettingsPerMethodResponse.dart';
import 'package:ejara_assignment_project/constants/app_apiConstants.dart';
import 'package:flutter/material.dart';

class PaymentMethodApis {
  static Future<PaymentMethodsResponse?> getPaymentMethods() async {
    try {
      final response = await const GenericRequest(
        method: RequestMethods.get,
        authApiCalls: false,
        url: AppApiConstants.listOfPaymentMethodsUrl,
      ).makeApiCall();

      if (response.statusCode == 200) {
        return PaymentMethodsResponse.fromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  static Future<PaymentSettingsPerMethodResponse?> getPaymentSettingsPerMethod(
    String paymentId,
  ) async {
    try {
      final response = await GenericRequest(
        method: RequestMethods.get,
        authApiCalls: false,
        url:
            '${AppApiConstants.listOfPaymentSettingsPerMethodUrl}$paymentId&countryCode=CM&transactionType=buy',
      ).makeApiCall();

      if (response.statusCode == 200) {
        return PaymentSettingsPerMethodResponse.fromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
