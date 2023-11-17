// ignore_for_file: file_names

import 'package:ejara_assignment_project/constants/app_textSizes.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 0.5),
        ),
      ),
    );
  }
}

class SplitDivider extends StatelessWidget {
  const SplitDivider({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomDivider(),
          Text(text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: AppTextSizes.labelText1)),
          const CustomDivider(),
        ],
      ),
    );
  }
}
