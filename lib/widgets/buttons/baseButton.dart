// ignore_for_file: file_names

import 'package:ejara_assignment_project/constants/app_colors.dart';
import 'package:ejara_assignment_project/constants/app_textSizes.dart';
import 'package:ejara_assignment_project/widgets/platformSpecificLoader.dart';
import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    this.onPressed,
    required this.label,
    required this.backgroundColor,
    required this.labelColor,
    this.isLoading = false,
    this.loaderColor = AppColor.white,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String label;
  final Color backgroundColor;
  final Color labelColor;
  final bool isLoading;
  final Color loaderColor;

  @override
  Widget build(BuildContext context) {
    Color getBgColor(Set<MaterialState> states) {
      if (states.any((e) => e == MaterialState.disabled)) {
        return const Color(0xFFE3E6EA);
      }

      return backgroundColor;
    }

    // Color getTextColor(Set<MaterialState> states) {
    //   if (states.any((e) => e == MaterialState.disabled)) {
    //     return Color(0xFF000000);
    //   }

    //   return labelColor;
    // }

    return SizedBox(
      height: 54,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(getBgColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          // foregroundColor: MaterialStateProperty.resolveWith(getTextColor),
        ),
        child: isLoading
            ? PlatformSpecificLoader(
                loaderColor: loaderColor,
              )
            : Text(
                label,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: labelColor,
                      fontSize: AppTextSizes.paragraphText2Medium,
                      fontWeight: FontWeight.w700,
                    ),
              ),
      ),
    );
  }
}
