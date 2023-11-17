// ignore_for_file: file_names

import 'package:ejara_assignment_project/constants/app_colors.dart';
import 'package:ejara_assignment_project/widgets/buttons/baseButton.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.color = AppColor.primary,
    this.disabled = false,
    this.isLoading = false,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final bool disabled;
  final String label;
  final Color color;
  final bool isLoading;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      isLoading: isLoading,
      onPressed: onPressed,
      label: label,
      backgroundColor: disabled ? const Color(0xFFE3E6EA) : color,
      labelColor: const Color(0xff7177ed),
      icon: icon,
    );
  }
}
