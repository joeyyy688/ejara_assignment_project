// ignore_for_file: file_names

import 'package:ejara_assignment_project/widgets/buttons/baseButton.dart';
import 'package:flutter/material.dart';

class AccentButton extends StatelessWidget {
  const AccentButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.color = const Color(0XFFFF9900),
    this.disabled = false,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final bool disabled;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPressed: onPressed,
      label: label,
      backgroundColor:
          disabled ? const Color(0xFF030412).withOpacity(0.2) : color,
      labelColor: Colors.white,
    );
  }
}
