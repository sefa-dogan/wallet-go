// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SFTextButton extends StatelessWidget {
  SFTextButton(
      {super.key, required this.buttonChild, required this.onPressedFunc});

  Widget buttonChild;
  Function() onPressedFunc;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressedFunc,
      child: buttonChild,
    );
  }
}
