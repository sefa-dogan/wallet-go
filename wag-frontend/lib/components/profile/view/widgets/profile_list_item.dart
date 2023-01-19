import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_gesture_row.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:get/get.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppIntValues.TWENTY),
      child: Column(
        children: [
          SFGestureRow(
              padding: const EdgeInsets.all(AppIntValues.TEN),
              title: AppStrings.PERSONAL_DETAILS,
              onTap: () => Get.toNamed(AppRoutes.PERSONAL_DETAILS_LIST_SCREEN)),
          SFGestureRow(
            padding: const EdgeInsets.all(AppIntValues.TEN),
            title: AppStrings.PAYMENT_METHODS,
            onTap: () => Get.toNamed(AppRoutes.PAYMENT_METHODS_LIST_SCREEN),
          ),
          SFGestureRow(
            padding: const EdgeInsets.all(AppIntValues.TEN),
            title: AppStrings.LANGUAGE,
            onTap: () => Get.toNamed(AppRoutes.LANGUAGE_LIST_SCREEN),
          ),
          SFGestureRow(
            padding: const EdgeInsets.all(AppIntValues.TEN),
            title: AppStrings.NOTIFICATIONS,
            onTap: () => Get.toNamed(AppRoutes.NOTIFICATIONS_LIST_SCREEN),
          ),
        ],
      ),
    );
  }
}
