// ignore_for_file: file_names

import 'package:ejara_assignment_project/constants/app_colors.dart';
import 'package:ejara_assignment_project/constants/app_textSizes.dart';
import 'package:flutter/material.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.white,
    dividerTheme:
        Theme.of(context).dividerTheme.copyWith(color: AppColor.grey7),
    dialogTheme: Theme.of(context).dialogTheme.copyWith(
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
          ),
        ),
    textTheme: Theme.of(context)
        .textTheme
        .apply(
          bodyColor: AppColor.primary,
          displayColor: AppColor.white,
        )
        .copyWith(
          bodyLarge: const TextStyle(
            fontSize: AppTextSizes.title1Regular,
            color: AppColor.primary,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: const TextStyle(
            fontSize: AppTextSizes.paragraphText2Medium,
            color: AppColor.primary,
            fontFamily: 'Montserrat',
          ),
          //
          // for button
          //
          labelLarge: const TextStyle(
            fontSize: AppTextSizes.buttonTextRegular,
            fontWeight: FontWeight.w600,
            color: AppColor.white,
            fontFamily: 'Montserrat',
          ),
        ),
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.light,
    ).copyWith(
      secondary: AppColor.white,
      error: AppColor.red,
      background: AppColor.white,
    ),
  );
}
