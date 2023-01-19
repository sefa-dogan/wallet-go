import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';

// ignore: must_be_immutable
class SFText extends StatelessWidget {
  SFText({super.key, required this.text});

  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: AppColor.appTitleBlack,
          fontWeight: FontWeight.bold,
          fontSize: AppIntValues.TWENTY),
    );
  }
}
