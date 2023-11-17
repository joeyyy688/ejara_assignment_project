// ignore_for_file: file_names

import 'package:ejara_assignment_project/constants/app_colors.dart';
import 'package:ejara_assignment_project/constants/app_textSizes.dart';
import 'package:flutter/material.dart';

InputDecoration filledInputDecoration({
  String? hint = '',
  String? helperText,
  Widget? suffixText,
  Widget? suffixIcon,
  Widget? prefixIcon,
}) {
  return InputDecoration(
    prefix: prefixIcon,
    hintText: hint,
    hintStyle: const TextStyle(
      color: AppColor.grey5,
      fontFamily: 'Montserrat',
      fontSize: AppTextSizes.labelText1Medium,
      fontWeight: FontWeight.w100,
    ),
    helperText: helperText,
    suffixIconConstraints: const BoxConstraints(minHeight: 20, minWidth: 30),
    suffix: suffixText,
    suffixIcon: suffixIcon,
    suffixStyle: const TextStyle(color: AppColor.primary),
    labelStyle: const TextStyle(
      color: Color(0xFFA3AEB8),
    ),
    errorStyle: const TextStyle(),
    errorMaxLines: 4,
    helperMaxLines: 4,
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(11.0)),
      borderSide: BorderSide(
        width: 1,
        color: Color(0XFFE3E6EA),
      ),
    ),
    disabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(11.0)),
      borderSide: BorderSide(
        width: 1,
        color: Color(0XFFE3E6EA),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(11.0)),
      borderSide: BorderSide(width: 1, color: AppColor.primary),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(11.0)),
      borderSide: BorderSide(width: 1, color: AppColor.primary),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(11.0)),
      borderSide: BorderSide(
        width: 1,
        color: AppColor.red,
      ),
    ),
  );
}
