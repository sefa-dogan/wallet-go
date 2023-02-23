import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/payments/viewmodel/payments_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';

class SFTabBar {
  final radiusIntValue = AppIntValues.TEN;
  final viewmodel = locator<PaymentsViewModel>();

  
  PreferredSizeWidget sfTabBar() {
    return TabBar(
        controller: viewmodel.tabController,
        padding: const EdgeInsets.only(
            left: AppIntValues.TWENTY, right: AppIntValues.TWENTY),
        indicator: ContainerTabIndicator(
            radius: BorderRadius.all(Radius.circular(radiusIntValue)),
            color: AppColor.appBlue),
        unselectedLabelColor: AppColor.appBlue,
        labelColor: AppColor.appWhite,
        tabs: [
          Tab(
            child: Text(AppStrings.TRANSACTIONS),
          ),
          Tab(
            child: Text(AppStrings.TEMPLATES),
          ),
        ]);
  }
}
