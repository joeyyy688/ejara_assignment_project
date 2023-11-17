import 'package:ejara_assignment_project/constants/app_colors.dart';
import 'package:ejara_assignment_project/constants/app_textSizes.dart';
import 'package:ejara_assignment_project/widgets/inputs/inputLabel.dart';
import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String labelText;
  final double labelTextSize;
  final Color labelColor;
  final FontWeight labelFontWeight;
  final double labelPaddingBottom;

  const Label(
      {Key? key,
      required this.labelText,
      this.labelTextSize = AppTextSizes.paragraphText1Medium,
      this.labelColor = AppColor.primary,
      this.labelFontWeight = FontWeight.w400,
      required this.labelPaddingBottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: labelPaddingBottom),
      child: InputLabel(
        label: labelText,
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: labelColor,
              fontWeight: labelFontWeight,
              fontSize: labelTextSize,
            ),
      ),
    );
  }
}
