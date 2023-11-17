// ignore_for_file: file_names

import 'package:ejara_assignment_project/constants/app_colors.dart';
import 'package:ejara_assignment_project/constants/app_textSizes.dart';
import 'package:ejara_assignment_project/widgets/customDivider.dart';
import 'package:flutter/material.dart';

class SelectPaymentMethodsItem extends StatelessWidget {
  const SelectPaymentMethodsItem({
    super.key,
    required this.title,
    required this.icon,
    required this.subtitle,
  });

  final String title;
  final IconData icon;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColor.primary.withOpacity(0.08),
            child: Icon(
              icon,
              color: AppColor.primary,
            ),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: AppTextSizes.labelText2, color: AppColor.grey4),
          ),
        ),
        const CustomDivider()
      ],
    );
  }
}
