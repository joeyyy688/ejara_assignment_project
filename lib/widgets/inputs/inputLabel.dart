// ignore_for_file: file_names

import 'package:flutter/widgets.dart';

class InputLabel extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;

  const InputLabel({Key? key, required this.label, this.labelStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(label, style: labelStyle);
  }
}
