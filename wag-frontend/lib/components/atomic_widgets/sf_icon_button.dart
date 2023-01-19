import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SFIconButton extends StatelessWidget {
  SFIconButton({
    super.key,
    required this.iconIconButton,
    required this.onPressedIconButton,
    this.iconColor,
  });

  IconData iconIconButton;
  Color? iconColor;
  Function() onPressedIconButton;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconIconButton,
        color: iconColor,
      ),
      onPressed: onPressedIconButton,
    );
  }
}
