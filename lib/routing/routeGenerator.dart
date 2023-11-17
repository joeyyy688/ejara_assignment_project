// ignore_for_file: file_names

import 'package:ejara_assignment_project/routing/routeErrorScreen.dart';
import 'package:ejara_assignment_project/screens/choosePaymentMethodScreen.dart';
import 'package:ejara_assignment_project/screens/loginScreen.dart';
import 'package:ejara_assignment_project/screens/newMobileMoneyScreen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case ChoosePaymentMethodScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const ChoosePaymentMethodScreen(),
        );
      case NewMobileMoneyScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const NewMobileMoneyScreen(),
        );
      default:
        _errorRoute();
        break;
    }
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) => const RouteErrorPage());
  }
}
