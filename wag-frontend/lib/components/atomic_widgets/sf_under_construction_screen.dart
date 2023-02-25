import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:get/get.dart';

class SFUnderConstructionScreen extends StatelessWidget {
  const SFUnderConstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.appBlack),
        backgroundColor: AppColor.appWhite,
        shadowColor: AppColor.appTransparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: Get.mediaQuery.size.width / 2,
                height: Get.mediaQuery.size.width / 2,
                child: Image.asset(AppStrings.UNDER_CONSTRUCTION_GIF)),
            Text(
              AppStrings.THE_UNDER_CONSTRUCTION,
              style: const TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
