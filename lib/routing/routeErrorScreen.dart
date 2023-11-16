// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:ejara_assignment_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RouteErrorPage extends StatefulWidget {
  const RouteErrorPage({Key? key}) : super(key: key);

  @override
  _RouteErrorPageState createState() => _RouteErrorPageState();
}

class _RouteErrorPageState extends State<RouteErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Page Error',
          style: TextStyle(
            fontSize: 12,
            color: AppColor.primary,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Text(
            'Page Not Available!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: AppColor.primary,
            ),
          ),
        ),
      ),
    );
  }
}
