import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:get/get.dart';

class SFAppBar {
  PreferredSizeWidget appBar(String title,
      {Color? appBarTheme = AppColor.appBlack,
      List<Widget>? actions,
      Function()? onPressedLeading}) {
    // ignore: no_leading_underscores_for_local_identifiers
    Function() _onPressed = onPressedLeading ?? () => Get.back();
    return AppBar(
        shadowColor: AppColor.appTransparent,
        backgroundColor: AppColor.appTransparent,
        leading: IconButton(
            onPressed: _onPressed,
            icon: Icon(
              Icons.arrow_back_ios,
              color: appBarTheme,
            )),
        title: Text(
          title,
          style: TextStyle(color: appBarTheme),
        ),
        actions: actions);
  }
}
