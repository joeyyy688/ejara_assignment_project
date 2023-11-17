// ignore_for_file: file_names

import 'package:ejara_assignment_project/apis/models/paymentSettingsPerMethodResponse.dart';
import 'package:flutter/material.dart';

class PaymentMethodsProvider with ChangeNotifier {
  //Local Variables
  PaymentSettingsPerMethodResponse? _paymentSettingPerMethodResponse;

  //Getters
  PaymentSettingsPerMethodResponse? get getPaymentSettingPerMethod =>
      _paymentSettingPerMethodResponse;

  //Methods
  void setPaymentSettingPerMethodResponse(
    PaymentSettingsPerMethodResponse? value,
  ) {
    _paymentSettingPerMethodResponse = value;
    notifyListeners();
  }
}
