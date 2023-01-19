// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';

class LocalGenericQuickActionsItem extends StatelessWidget {
  LocalGenericQuickActionsItem(
      {super.key,
      required this.onTapContainer,
      required this.textContainer,
      required this.iconContainer});

  Function() onTapContainer;
  String textContainer;
  IconData iconContainer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTapContainer,
        child: Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 64, 96, 178),
              borderRadius:
                  BorderRadius.all(Radius.circular(AppIntValues.TEN))),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                iconContainer,
                color: AppColor.appWhite,
              ),
              Text(
                textContainer,
                style: const TextStyle(
                  color: AppColor.appWhite,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )),
        ));
  }
}
