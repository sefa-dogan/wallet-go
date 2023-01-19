import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';

// ignore: must_be_immutable
class SFGestureRow extends StatelessWidget {
  SFGestureRow(
      {super.key,
      required this.title,
      required this.onTap,
      this.leadingIcon,
      this.trailingWidget,
      required this.padding,
      this.borderColor = AppColor.appTransparent});
  String title;
  Function() onTap;
  Widget? leadingIcon;
  Widget? trailingWidget;
  Color borderColor;
  EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    var size = AppIntValues.FIFTEEN;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                color: AppColor.appGrey,
                borderRadius: const BorderRadius.all(
                  Radius.circular(AppIntValues.TEN),
                )),
            child: Padding(
              padding: const EdgeInsets.all(AppIntValues.TEN),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: AppIntValues.TEN),
                        child: leadingIcon ?? const SizedBox(),
                      ),
                      Text(
                        title,
                        style: TextStyle(fontSize: size),
                      ),
                    ],
                  ),
                  trailingWidget ??
                      Icon(
                        Icons.arrow_forward_ios,
                        size: size,
                      )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
