// ignore_for_file: file_names

enum RequestMethods { get, post, put, delete, patch }

class AppApiConstants {
  static const baseUrlV1 = 'https://testbox-nellys-coin.ejaraapis.xyz/api/v1';
  static const baseUrlV2 = 'https://testbox-nellys-coin.ejaraapis.xyz/api/v2';
  static const apiKey = 'K[bb@c*heYNTOd[UVBmLevq0(';
  static const clientId = '02d5f007e2';
  static const appVersion = '3.1.5';
  static const appPlatform = 'android-test';
  static const client = 'mobile';

  static const loginUrl = '$baseUrlV1/auth/login';
  static const listOfPaymentMethodsUrl =
      '$baseUrlV2/marketplace/payment-types-per-country?countryCode=CM&transactionType=buy';
  static const listOfPaymentSettingsPerMethodUrl =
      '$baseUrlV1/customer/payment-settings-per-type?paymentTypeId=';
}
