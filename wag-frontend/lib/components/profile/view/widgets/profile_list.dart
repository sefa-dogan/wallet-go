import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_gesture_row.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:get/get.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SFGestureRow(
            padding: const EdgeInsets.all(0),
            title: AppStrings.PERSONAL_DETAILS,
            onTap: () => Get.toNamed(AppRoutes.PERSONAL_DETAILS_LIST_SCREEN)),
        SFGestureRow(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          title: AppStrings.PAYMENT_METHODS,
          onTap: () => Get.toNamed(AppRoutes.PAYMENT_METHODS_LIST_SCREEN),
        ),
        SFGestureRow(
          padding: const EdgeInsets.all(0),
          title: AppStrings.LANGUAGE,
          onTap: () => Get.toNamed(AppRoutes.LANGUAGE_LIST_SCREEN),
        ),
      ],
    );
  }
}
