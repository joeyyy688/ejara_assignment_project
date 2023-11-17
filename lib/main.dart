import 'package:ejara_assignment_project/constants/app_icons.dart';
import 'package:ejara_assignment_project/providers/paymentMethodsProvider.dart';
import 'package:ejara_assignment_project/routing/routeGenerator.dart';
import 'package:ejara_assignment_project/themes/themeData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PaymentMethodsProvider>(
          create: (context) => PaymentMethodsProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );

  // preload all SVG Icons
  await AppIcons.preloadIconsSVGs();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: 'Ejara Assignmet Project',
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: lightThemeData(context),
      ),
    );
  }
}
