import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:get/get.dart';

class SFSnackBar {
  showSnackBar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        barBlur: 1,
        colorText: AppColor.appWhite,
        backgroundColor: AppColor.appBlue,
        animationDuration: const Duration(milliseconds: 500),
        duration: const Duration(seconds: 2));
  }
}
