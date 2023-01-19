import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';

// ignore: must_be_immutable
class SFToast extends StatelessWidget {
  SFToast({super.key, required this.message});
  String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: AppColor.appGrey,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
        ],
      ),
    );
  }
}
