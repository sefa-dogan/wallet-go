import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';

class SFTabBar {
  final radiusIntValue = AppIntValues.TEN;

  PreferredSizeWidget sfTabBar() {
    return TabBar(
        padding: const EdgeInsets.only(
            left: AppIntValues.TWENTY, right: AppIntValues.TWENTY),
        indicator: ContainerTabIndicator(
            radius: BorderRadius.all(Radius.circular(radiusIntValue)),
            color: AppColor.appBlue),
        // splashBorderRadius: BorderRadius.all(Radius.circular(10)),
        unselectedLabelColor: AppColor.appBlue,
        labelColor: AppColor.appWhite,
        tabs: const [
          Tab(
            child: Text(AppStrings.TRANSACTIONS),
          ),
          Tab(
            child: Text(AppStrings.TEMPLATES),
          ),
        ]);
  }
}
