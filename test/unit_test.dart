// ignore_for_file: file_names

import 'package:ejara_assignment_project/Utilities/userAuthSecureStorage.dart';
import 'package:ejara_assignment_project/apis/services/authApis.dart';
import 'package:ejara_assignment_project/apis/services/paymentMethodsApis.dart';
import 'package:ejara_assignment_project/constants/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  test('Login API Test', () async {
    const username = 'ejaraTests';
    const password = 'CmKVGexi%REJjn!u65BI7PlR5';

    final response = await AuthApis.login(username, password);

    expect(response, isNotNull);

    if (response != null) {
      expect(response.responsecode, 'login_ok');
      expect(response.message, 'Login successful');
      expect(response.token, isA<String>());
    }
  });

  test('Get Payment Methods API Test', () async {
    WidgetsFlutterBinding.ensureInitialized();

    final authResponse = await AuthApis.login(username, password);

    FlutterSecureStorage.setMockInitialValues({});

    await UserAuthSecureStorage.setUserAuthToken(
      authResponse!.token,
    );

    final paymentMethodresponse = await PaymentMethodApis.getPaymentMethods();

    expect(paymentMethodresponse, isNotNull);

    if (paymentMethodresponse != null) {
      expect(paymentMethodresponse.responseCode,
          'get_payment_types_per_country_ok');
      expect(paymentMethodresponse.message, '2 payment type(s) found');
      expect(paymentMethodresponse.data, isNotNull);
      expect(paymentMethodresponse.data.length, 2);

      // Check the details of the first payment method
      expect(paymentMethodresponse.data[0].id, 1);
      expect(paymentMethodresponse.data[0].code, 'MOMO');
      expect(paymentMethodresponse.data[0].titleEn, 'Mobile Money');
      expect(paymentMethodresponse.data[0].descriptionEn,
          'Instantly - 3.1% Telco Fees');

      // Check the details of the second payment method
      expect(paymentMethodresponse.data[1].id, 2);
      expect(paymentMethodresponse.data[1].code, 'BAC');
      expect(paymentMethodresponse.data[1].titleEn, 'Bank');
      expect(paymentMethodresponse.data[1].descriptionEn, '1 business Day');
    }
  });

  test('Get Payment Settings Per Method API Test', () async {
    WidgetsFlutterBinding.ensureInitialized();

    final authResponse = await AuthApis.login(username, password);

    FlutterSecureStorage.setMockInitialValues({});

    await UserAuthSecureStorage.setUserAuthToken(
      authResponse!.token,
    );

    const paymentId = '1';

    final paymentMethodresponse =
        await PaymentMethodApis.getPaymentSettingsPerMethod(paymentId);

    expect(paymentMethodresponse, isNotNull);

    if (paymentMethodresponse != null) {
      expect(
          paymentMethodresponse.responseCode, 'payment_settings_per_type_ok');
      expect(paymentMethodresponse.message,
          'get payment settings per type successful');
      expect(paymentMethodresponse.data, isNotNull);
      expect(paymentMethodresponse.data.isEmpty, isTrue);
    }
  });
}
