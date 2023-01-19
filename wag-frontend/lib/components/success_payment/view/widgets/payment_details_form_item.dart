// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';

class PaymentDetailsFormItem extends StatelessWidget {
  PaymentDetailsFormItem(
      {super.key, required this.title, required this.subtitle});
  String title;
  String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppIntValues.TEN, bottom: AppIntValues.TEN),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: AppColor.appTextGrey),
          ),
          Text(subtitle)
        ],
      ),
    );
  }
}
