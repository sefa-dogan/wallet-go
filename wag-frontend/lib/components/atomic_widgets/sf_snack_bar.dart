import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:get/get.dart';

class SFSnackBar {
  void showSnackBar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        barBlur: 1,
        colorText: AppColor.appWhite,
        backgroundColor: AppColor.appBlue,
        animationDuration: Duration(milliseconds: 500),
        duration: Duration(seconds: 2));
  }
}
