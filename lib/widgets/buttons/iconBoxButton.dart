// ignore_for_file: file_names

import 'package:ejara_assignment_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class IconBoxButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTapHandler;
  final Size? iconBoxButtonSize;
  const IconBoxButton({
    Key? key,
    required this.icon,
    required this.onTapHandler,
    this.iconBoxButtonSize = const Size(20, 30),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary.withOpacity(0.08),
        shadowColor: Colors.transparent,
        shape: const CircleBorder(),
        minimumSize: iconBoxButtonSize,
        elevation: 1,
      ),
      onPressed: onTapHandler,
      child: icon,
    );
  }
}
