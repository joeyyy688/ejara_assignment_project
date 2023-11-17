// ignore_for_file: file_names

import 'package:ejara_assignment_project/constants/app_colors.dart';
import 'package:ejara_assignment_project/constants/app_textSizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchActionCard extends StatefulWidget {
  final String title;
  final void Function(bool) onChanged;
  final bool switchValue;

  const SwitchActionCard({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.switchValue,
  }) : super(key: key);

  @override
  State<SwitchActionCard> createState() => _SwitchActionCardState();
}

class _SwitchActionCardState extends State<SwitchActionCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            trackColor: AppColor.grey7,
            activeColor: AppColor.primary,
            thumbColor: AppColor.white,
            value: widget.switchValue,
            onChanged: (bool value) {
              widget.onChanged(value);
            },
          ),
        ),
        Expanded(
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: AppTextSizes.labelText1Medium,
                ),
          ),
        ),
      ],
    );
  }
}
