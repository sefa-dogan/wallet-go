import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_bottom_app_bar.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/sf_tab_bar.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/sf_tab_bar_view.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/bottomappbar/sf_bottom_app_bar_store.dart';

class PaymentsScreen extends StatelessWidget {
  PaymentsScreen({super.key});
  final bottomAppBarviewmodel = locator<SFBottomAppBarStore>();
  final radiusIntValue = AppIntValues.TEN;
  @override
  Widget build(BuildContext context) {
    bottomAppBarviewmodel.index = 1;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shadowColor: AppColor.appTransparent,
          title: const Text(AppStrings.PAYMENTS,
              style: TextStyle(color: AppColor.appBlack)),
          backgroundColor: AppColor.appWhite,
          bottom: SFTabBar().sfTabBar(),
        ),
        backgroundColor: AppColor.appWhite,
        bottomNavigationBar: SFBottomAppBar(),
        floatingActionButton: const SizedBox(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Padding(
          padding: const EdgeInsets.all(AppIntValues.TWENTY),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [Expanded(child: SFTabBarView())],
          ),
        ),
      ),
    );
  }
}
