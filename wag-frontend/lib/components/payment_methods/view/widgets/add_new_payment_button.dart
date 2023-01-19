import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';

class AddNewPaymentButton extends StatelessWidget {
  const AddNewPaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = AppColor.appBlue;
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(AppIntValues.TEN),
        padding: const EdgeInsets.all(AppIntValues.TEN),
        decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius:
                const BorderRadius.all(Radius.circular(AppIntValues.TEN))),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                AppStrings.ADD_NEW_PAYMENT_METHOD,
                style: TextStyle(color: color),
              ),
              Icon(
                Icons.add,
                color: color,
              )
            ],
          ),
        ),
      ),
    );
  }
}
