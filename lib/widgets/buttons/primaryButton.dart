// ignore_for_file: file_names

import 'package:ejara_assignment_project/widgets/buttons/baseButton.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.color = Colors.black,
    this.disabled = false,
    this.isLoading = false,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final bool disabled;
  final String label;
  final Color color;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      isLoading: isLoading,
      onPressed: onPressed,
      label: label,
      backgroundColor: disabled ? const Color(0xFFE3E6EA) : color,
      labelColor: Colors.white,
    );
  }
}
