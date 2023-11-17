// ignore_for_file: file_names

import 'package:ejara_assignment_project/constants/app_colors.dart';
import 'package:ejara_assignment_project/widgets/buttons/iconBoxButton.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.pageBackButtonCallback,
      required this.iconData});

  final Function pageBackButtonCallback;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 54, bottom: 12),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 13),
              child: IconBoxButton(
                icon: Icon(
                  iconData,
                  size: 17,
                  color: AppColor.primary,
                ),
                onTapHandler: () => pageBackButtonCallback.call(),
                iconBoxButtonSize: const Size(20, 40),
              ),
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
