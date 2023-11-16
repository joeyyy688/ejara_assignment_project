// ignore_for_file: file_names

import 'package:ejara_assignment_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonOutline extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color? borderColor;
  final Color? textColor;
  final double? buttonOutlineHeight;
  final TextStyle? outlineButtonTextStyle;

  const ButtonOutline({
    Key? key,
    required this.label,
    this.onPressed,
    this.borderColor,
    this.textColor,
    this.outlineButtonTextStyle,
    this.buttonOutlineHeight = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    const color = Color(0xffD6D6D6);

    return SizedBox(
      height: buttonOutlineHeight,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            BorderSide(
                color: onPressed != null
                    ? (borderColor ?? AppColor.primary)
                    : color),
          ),
        ),
        child: Text(
          label,
          style: outlineButtonTextStyle ??
              themeData.textTheme.labelLarge!.copyWith(
                color:
                    onPressed == null ? color : (textColor ?? AppColor.primary),
              ),
        ),
      ),
    );
  }
}
