// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformSpecificLoader extends StatelessWidget {
  const PlatformSpecificLoader({super.key, required this.loaderColor});

  final Color loaderColor;

  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS
        ? CupertinoActivityIndicator(
            color: loaderColor,
            radius: 13,
          )
        : SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: loaderColor,
              strokeWidth: 3,
            ),
          ));
  }
}
